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

var registeredPatients = [];
var PROJECT_CODE = 'CLQ';

// var totalPatients = 5;
// patientsList = _.take(patientsList, totalPatients);

var count = 0;

queue.add(login)
  .then(function () {
    buildDay();
  });
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
    console.log('_____________________________________'.bold.cyan);
    deferred.resolve();
    nextDay();
    buildDay();
    return;
  }

  /**
   * Calculate Tasks
   */
  var numberOfPatients = _.random(1, 3);
  var numberOfInvoices = _.random(1, 6);
  var numberOfPayments = _.random(1, 6);
  // TODO ADD REPORTS + POSTING + TRANSFERS TO TASKS
  // the journal is posted to the general ledger at the end of every day

  // weekly reports are compiled at the end of the last work day
  if (IS_LAST_WORK_DAY) {

  }

  console.log('-> Registering', String(numberOfPatients).bold.blue, 'patients');
  console.log('-> Invoicing', String(numberOfInvoices).bold.blue, 'patients');

  /**
   * Populate Task List
   */

  var dailyTasks = [];

  populateTaskList(dailyTasks, registerPatient, numberOfPatients);
  populateTaskList(dailyTasks, invoicePatient, numberOfInvoices);
  // populateTaskList(dailyTasks, payInvoice, numberOfPayments);

  /**
   * Calculate Time Interval Sets
   */
  var numberOfActions = numberOfPatients + numberOfInvoices;
  // var numberOfActions = numberOfPatients + numberOfInvoices + numberOfPayments;

  // minute units
  var workDay = 480;

  var minimumIncrement = 20;
  var maximumIncrement = Math.round(480 / numberOfActions);

  dailyTasks = _.shuffle(dailyTasks);

  // ensure a patient is registered first thing in the morning always
  var registerIndex = _.indexOf(dailyTasks, registerPatient);
  if (registerIndex > 0) {
    _.pullAt(dailyTasks, [registerIndex]);
    dailyTasks.unshift(registerPatient);
  }

  for (var i = 0; i < dailyTasks.length - 1; i++) {
    queue.add(dailyTasks[i]);
    queue.add(setTime);
  };

  // add the final task
  queue.add(dailyTasks[dailyTasks.length - 1])
    .then(function () {
      console.log('_____________________________________'.bold.cyan);
      deferred.resolve();
      nextDay();
      buildDay();
    });


  function setTime() {
    var timeDifference = _.random(minimumIncrement, maximumIncrement);
    today.add(timeDifference, 'minutes');
    lib.setTime(today);
  }

  function nextDay() {
    today.add(1, 'day');
    today.hour(9);
    today.minutes(0);
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
  return lib.protractor('patientInvoice', {invoiceDetails : invoiceDetails});
}

function registerPatient() {
  var index = registeredPatients.length;
  var patient = patientsList[index];

  if (!patient.hospital_no) {
    patient.hospital_no = 'TMP'.concat(index);
  }

  // This is presumptious but EH
  patient.pid = 'CLQ'.concat(index + 1);
  registeredPatients.push(patient);
  // currentDate.add(1, 'day');

  return lib.protractor('patientRegistration', {patient : patient});
}
