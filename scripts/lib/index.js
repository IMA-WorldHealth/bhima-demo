'use strict';
var exec = require('child_process').exec;

var moment = require('moment');
var _ = require('lodash');
var colors = require('colors');

var seleniumId, silentDebug;
var protractorPath = './../node_modules/.bin/protractor';
var configPath = './demo.conf.js'

module.exports = function (id, debug) {
  seleniumId = id;
  silentDebug = debug;

  return {
    protractor : execProtractor,
    setTime : setTime
  };
}

function execProtractor(suite, params) {
  var start = new moment();
  var deferred = Promise.defer();
  var command = `${protractorPath} ${configPath} --seleniumSessionId=${seleniumId} --suite ${suite} `;

  var suitemsg = suite.yellow;
  var startmsg = `Running action (${suitemsg})`.gray;
  console.log(startmsg);
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
    if (!silentDebug) {
      console.log(stdout);
    }

    var end = new moment();
    var diff = end.diff(start, 'seconds');
    var diffms = String(end.diff(start, 'milliseconds'));
    var msg = `Action ran for ${diff}s (`.gray + `${diffms}ms`.bold + `)`.gray;
    console.log(msg);
    deferred.resolve();
  });
  return deferred.promise;
}


function setTime(dateObject) {
  var datestring = dateObject.format('"MMM DD Y HH:mm:ss"');
  console.log(`Setting the time ${datestring}`.dim.gray);
  exec('date -s '.concat(datestring), function (error) {
    if (error) {
      console.error('Unable to set time, are you sudo?'.bold.red);
    }
  });
}

