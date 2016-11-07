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
var exec = require('child_process').exec;
var moment = require('moment');
var request = require('request');
var Queue = require('promise-queue');

var queue = new Queue(1, Infinity);

var protractorPath = './../node_modules/.bin/protractor';
var configPath = 'demo.conf.js'

let fiscalYearStart = '2015-01-01 09:00';
let currentDate = new moment(fiscalYearStart);

let datestring = currentDate.format('"MMM DD Y HH:mm:ss"');
exec('date -s '.concat(datestring));

function execProtractor(suite, params) {
  var deferred = Promise.defer();
  var command = `${protractorPath} ${configPath} --seleniumSessionId=${seleniumSessionId} --suite ${suite} `;

  if (params) {
    _.forEach(params, function (value, key) {
      command = command.concat('--params.', key, '=\'', JSON.stringify(value), '\'');
    })
  }
  // console.log('Executing command', command);

  exec(command, function(error, stdout, stderr) {
    if (error) {
      console.log('error', error);
      console.log('stdout', stdout);
      console.log('stderr', stderr);
      deferred.reject(error);
      return;
    }
    if (!SILENT_DEBUG) {
      console.log(stdout);
    }
    deferred.resolve();
  });
  return deferred.promise;
}

// step through days performing day/ week/ month/ year tasks ignoring sundays
function timeManager() {

}

// Patient Registrations
// TODO Move to file
var totalPatients = 15;
var patientsList = require('./data/patients');
patientsList = _.take(patientsList, totalPatients);

queue.add(() => { return execProtractor('login') });
registerPatients();
// .then(() => registerPatients())
// .then(() => {
//
//
    var invoiceDetails = {
      patient : { pid : 'CLQ1' },
      inventoryItems : [
        { invoice: '110001', qte: 5 }, { invoice: '100102', qte: 100 }, { invoice: '100095', qte: 10 },
        { invoice: '150061', qte: 10 }, { invoice: '170449', qte: 1 }, { invoice: '110006', qte: 1 }
      ]
    };
    queue.add(() => { return execProtractor('patientInvoice', {invoiceDetails : invoiceDetails}) });
// });

function registerPatients() {
  // return patientsList.reduce(function (current, next) {
  //   return current.then(function () {

  //     let datestring = currentDate.format('"MMM DD Y HH:mm:ss"');
  //     exec('date -s '.concat(datestring));

  //     currentDate.add(1, 'day');
  //     console.log('[Register Patient]', next.name);
  //     return execProtractor('patientRegistration', {patient : next});
  //   });
  // }, Promise.resolve())

  patientsList.forEach(function (patient) {
    return queue.add(function () {
      let datestring = currentDate.format('"MMM DD Y HH:mm:ss"');
      exec('date -s '.concat(datestring));

      currentDate.add(1, 'day');
      console.log('[Register Patient]', patient.name);
      return execProtractor('patientRegistration', {patient : patient});

    });
  });
}
