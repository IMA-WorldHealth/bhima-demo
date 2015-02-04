#!/usr/bin/env node

'use strict';

// The code for setting up the selenium environment is forked from the
// protractor code base
// The original can be found https://github.com/angular/protractor/blob/master/scripts/attachSession.js

var http = require('http'),
    spawn = require('child_process').spawnSync,
    fs = require('fs');

var outputFile = true;

var sessionId = '';

// 1. Create a new selenium session.
var postData = JSON.stringify(
  {'desiredCapabilities': {'browserName': 'chrome'}});
var createOptions = {
  hostname: 'localhost',
  port: 4444,
  path: '/wd/hub/session',
  method: 'POST',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Content-Length': Buffer.byteLength(postData)
  }
};
var req = http.request(createOptions, function(res) {
  res.on('data', setBody);
  res.on('end', checkSession);
});
req.write(postData);
req.end();

// 2. After making the request to create a selenium session, read the selenium
// session id.
var setBody = function(chunk) {
  var body = chunk.toString();
  sessionId = JSON.parse(body).sessionId;
};

// 3. After getting the session id, verify that the selenium session exists.
// If the session exists, run the protractor test.
var checkSession = function() {
  var checkOptions = {
    hostname: 'localhost',
    port: 4444,
    path: '/wd/hub/session/' + sessionId,
    method: 'GET'
  };
  var state = '';
  var req = http.request(checkOptions, function(res) {
    res.on('data', function(chunk) {
      state = JSON.parse(chunk.toString()).state;
    });
    res.on('end', function() {
      if (state === 'success') {

        if (outputFile) {
          var format = JSON.stringify({
            seleniumServerId : sessionId
          });
          var output = `const output = ${format}; module.exports = output;`;
          fs.writeFile('selenium_config.js', output);
          console.log('Writing configuration file...');
        } else {
          // directly run the demo build
          // environment variable work around
          var env = Object.create( process.env );
          env.SELENIUM_ID = sessionId;
          var runScript = spawn('node', ['demo'], {env : env});
          console.log(runScript.stdout.toString());
          if (runScript.status !== 0) {
            throw new Error('Script did not run properly.');
          }
        }
      }
      else {
        throw new Error('The selenium session was not created.');
      }


      // checkStoppedSession();
    });
  });
  req.end();
};

// 4. After the protractor test completes, check to see that the session still
// exists. If we can find the session, delete it.
var checkStoppedSession = function() {
  var checkOptions = {
    hostname: 'localhost',
    port: 4444,
    path: '/wd/hub/session/' + sessionId,
    method: 'GET'
  };
  var state = '';
  var req = http.request(checkOptions, function(res) {
    res.on('data', function(chunk) {
      state = JSON.parse(chunk.toString()).state;
    });
    res.on('end', function() {
      if (state === 'success') {
        deleteSession();
      }
      else {
        throw new Error('The selenium session should still exist.');
      }
    });
  });
  req.end();
};

// 5. Delete the selenium session.
var deleteSession = function() {
  var deleteOptions = {
    hostname: 'localhost',
    port: 4444,
    path: '/wd/hub/session/' + sessionId,
    method: 'DELETE'
  };
  var req = http.request(deleteOptions);
  req.end();
};
