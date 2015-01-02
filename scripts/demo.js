#!/usr/bin/env node
'use strict';

// expects ./senemium_config.js
const USE_CONFIG = true;
const SILENT_DEBUG = true;

var seleniumSessionId = process.env.SELENIUM_ID;

// Check to see if a configuration file has been provided - allow scripts to set
// this through process env or configuration file
if (USE_CONFIG) {
  const configurationFileId = require('./selenium_config');
  seleniumSessionId = configurationFileId.seleniumServerId;
}

if (!seleniumSessionId) {
  throw new Error('no selenium session ID passed, terminating.');
}

var _ = require('lodash');
var moment = require('moment');
var request = require('request');
var Queue = require('promise-queue');

var lib = require('./lib')(seleniumSessionId, SILENT_DEBUG);

var queue = new Queue(1, Infinity);
let fiscalYearStart = '2015-01-01 09:00';
let today = new moment(fiscalYearStart);

var patientsList = require('./data/patients');
var inventory = require('./data/inventory').rows;


// map of patient ID to invoices, invoices are in order of creation and should be
// paid from the bottom up
var invoices = {};
var dailyCashMovement = [];

var registeredPatients = [];
var PROJECT_CODE = 'HSP';

// var totalPatients = 5;
// patientsList = _.take(patientsList, totalPatients);

var count = 0;

queue.add(login)
  .then(function () {
    buildDay();
  });
// transferCash();
// queue.add(registerPatient);
// queue.add(invoicePatient);
// queue.add(registerPatient);

var SUNDAY = 0;
var MONDAY = 1;
var SATURDAY = 6;

function buildDay() {
  var deferred = Promise.defer();

  console.log();
  var title = today.format('LLLL');
  console.log(title.bold.underline.cyan);

  lib.setTime(today);

  var currentDay = today.day();
  var currentMonthLength = today.daysInMonth();

  var IS_SUNDAY = currentDay === SUNDAY;
  var IS_FIRST_WORK_DAY = currentDay === MONDAY;
  var IS_LAST_WORK_DAY = currentDay === SATURDAY;

  var IS_LAST_MONTH_DAY;

  if (currentDay === SATURDAY) {
    // factor in Sunday being the last day of the month
    IS_LAST_MONTH_DAY = today.date() === currentMonthLength || today.date() + 1 === currentMonthLength;
  } else {
    IS_LAST_MONTH_DAY = today.date() === currentMonthLength;
  }

  // this enterprise doesn't work on Sundays
  if (IS_SUNDAY) {
    nextDay();
    return;
  }

  /**
   * Calculate Tasks
   */
  var numberOfPatients = _.random(1, 1);
  var numberOfInvoices = _.random(1, 1);
  var numberOfPayments = _.random(1, 1);
  // var numberOfPatients = _.random(1, 1);
  // var numberOfInvoices = _.random(1, 1);
  // var numberOfPayments = _.random(1, 1);

  // ensure number of payments can be met
  var maxInvoices = availableInvoices();
  if (numberOfPayments > maxInvoices) {
    numberOfPayments = maxInvoices;
  }
  // TODO ADD REPORTS + POSTING + TRANSFERS TO TASKS
  // the journal is posted to the general ledger at the end of every day

  // weekly reports are compiled at the end of the last work day
  if (IS_LAST_WORK_DAY) {

  }

  console.log('-> Registering', String(numberOfPatients).bold.blue, 'patients');
  console.log('-> Invoicing', String(numberOfInvoices).bold.blue, 'patients');
  console.log('-> Paying', String(numberOfPayments).bold.blue, 'patients');

  /**
   * Populate Task List
   */

  var dailyTasks = [];

  populateTaskList(dailyTasks, registerPatient, numberOfPatients);
  populateTaskList(dailyTasks, invoicePatient, numberOfInvoices);
  populateTaskList(dailyTasks, payInvoice, numberOfPayments);

  dailyTasks = _.shuffle(dailyTasks);

  // ensure a patient is registered first thing in the morning always
  var registerIndex = _.indexOf(dailyTasks, registerPatient);
  if (registerIndex > 0) {
    _.pullAt(dailyTasks, [registerIndex]);
    dailyTasks.unshift(registerPatient);
  }

  // tranfer aux -> primary every day
  if (numberOfPayments) {
    dailyTasks.push(transferCash);
  }

  /**
   * Calculate Time Interval Sets
   */
  // var numberOfActions = numberOfPatients + numberOfInvoices;
  var numberOfActions = dailyTasks.length;

  // minute units
  var workDay = 480;

  var minimumIncrement = 20;
  var maximumIncrement = Math.round(480 / numberOfActions);

  for (var i = 0; i < dailyTasks.length - 1; i++) {
    queue.add(dailyTasks[i]);
    queue.add(setTime);
  };

  // add the final task
  queue.add(dailyTasks[dailyTasks.length - 1])
    .then(function () {
      nextDay();
    });


  function setTime() {
    var timeDifference = _.random(minimumIncrement, maximumIncrement);
    today.add(timeDifference, 'minutes');
    lib.setTime(today);
  }

  function nextDay() {
    console.log('_____________________________________'.bold.cyan);
    deferred.resolve();

    // reset daily tracking
    dailyCashMovement.length = 0;
    dailyCashMovement = [];

    today.add(1, 'day');
    today.hour(9);
    today.minutes(0);

    buildDay();
  }
  return deferred.promise;
}

function populateTaskList(list, method, total) {
  for (var i = 0; i < total; i++) {
    list.push(method);
  }
}

function login() {
  return lib.protractor('login');
}

function invoicePatient() {
  var selectPatient = _.sample(registeredPatients);

  var invoiceDetails = {
    patient : { pid : selectPatient.pid }
  };


  invoiceDetails.inventoryItems = _.sampleSize(inventory, _.random(1, 5));

  invoiceDetails.inventoryItems = _.map(invoiceDetails.inventoryItems, function (item) {
    item.quantity = _.random(1, 5);
    return item;
  });

  // TODO this does not factor in billing services or subsides
  var totalCost = _.reduce(invoiceDetails.inventoryItems, function(sum, next) {
    return sum + (next.price * next.quantity);
  }, 0);

  totalCost = _.round(totalCost, 2);

  console.log(`Total cost of invoice ${totalCost}`.bold.cyan);

  invoices[selectPatient.pid] = invoices[selectPatient.pid] || [];
  invoices[selectPatient.pid].push({
    patientId : selectPatient.pid,
    cost : totalCost
  });

  return lib.protractor('patientInvoice', {invoiceDetails : invoiceDetails});
}

// generic transfer from the cash window to the princaple cash box
function transferCash() {

  var totalPaidToday = _.reduce(dailyCashMovement, function (sum, next) {
    return sum + next.cost;
  }, 0);
  var records = {
    cashBoxAmount : totalPaidToday
  };

  console.log('TOTAL TO TRANSFER FROM CASH WINDOW'.bold.cyan);
  console.log(records.cashBoxAmount);

  return lib.protractor('cashTransfer', { cashRecords : records });
}

function payInvoice() {
  var availablePatients = _.keys(invoices);
  var targetPatient = _.sample(availablePatients);

  console.log(`Paying invoices for ${targetPatient}`.bold.cyan);
  console.log(`${JSON.stringify(invoices[targetPatient])}`.bold.cyan);

  // always take the first bill that the patient was billed
  var invoice = invoices[targetPatient][0];

  console.log('INVOICE TO BE PAYED'.bold.cyan);
  console.log(JSON.stringify(invoice).bold.cyan);

  var payFullInvoice = true;

  // if payment was made in full
  invoices[targetPatient].shift();

  console.log('After payment:'.bold.cyan);
  console.log(`${JSON.stringify(invoices[targetPatient])}`.bold.cyan);

  dailyCashMovement.push(invoice);

  if (invoices[targetPatient].length === 0) {
    delete invoices[targetPatient];
  }


  return  lib.protractor('invoicePayment', { invoice : invoice });
}

// return the total number of invoices that can be paid today without creating any new ones
function availableInvoices() {
  return _.reduce(invoices, function (sum, patientInvoices, patientKey) {
    // sum for this patient
    return sum + patientInvoices.length;
  }, 0);
}

function registerPatient() {
  var index = registeredPatients.length;
  var patient = patientsList[index];

  if (!patient.hospital_no) {
    patient.hospital_no = 'TMP'.concat(index);
  }

  // This is presumptious but EH
  patient.pid = PROJECT_CODE.concat(index + 1);
  registeredPatients.push(patient);
  // currentDate.add(1, 'day');

  return lib.protractor('patientRegistration', {patient : patient});
}
