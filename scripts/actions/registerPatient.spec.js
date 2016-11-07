/* jshint expr: true */
/* global element, by, browser */

const path = require('path');
const _root = '../../latest/test/end-to-end/shared/';

function root(key) {
  return path.join(__dirname, _root, key);
}


const chai = require('chai');
const expect = chai.expect;

const _ = require('lodash');
const moment = require('moment');
const FU = require(root('FormUtils'));
const components = require(root('components'));
const helpers = require(root('helpers'));
const dbPatients = require(root('../patient/db/patients'));

helpers.configure(chai);

describe.only('Patient Registration', () => {
  'use strict';

  const path = '#/patients/register';
  beforeEach(() => helpers.navigate(path));

  console.log('received params');
  var patient = JSON.parse(browser.params.patient);
  console.log(patient);
  console.log(typeof(patient));

  const TOTAL_ITEMS = 2;

  let inc = 0;
  let date = new Date;

  let patients = _.take(dbPatients, TOTAL_ITEMS);

  let item = patient;
  let index = 0;

  // patients.forEach((item, index) => {

    it(`Register patient ${index} of ${patients.length}`, done => {

      browser.ignoreSynchronization = true;
      // patient name
      FU.input('PatientRegCtrl.medical.display_name', item.name);


      // hospital number and yob
      item.hospital_no = item.hospital_no && item.hospital_no !== '0' ? item.hospital_no : 'D00' + inc++;
      FU.input('PatientRegCtrl.medical.hospital_no', item.hospital_no);
      FU.input('PatientRegCtrl.yob', item.yob);


      // set the gender of the patient
      if (item.sex === 'M') {
        element(by.id('male')).click();
      } else {
        element(by.id('female')).click();
      }


      // set the locations via the "locations" array
      components.locationSelect.set(helpers.data.locations, 'origin-location-id');
      components.locationSelect.set(helpers.data.locations, 'current-location-id');

      // set the debtor group
      let debtorGroup = patientDebtorGroup(index);
      FU.uiSelect('PatientRegCtrl.finance.debtor_group_uuid', debtorGroup);

      item.registration_date = patientRegistrationDate(index);
      components.dateEditor.set(item.registration_date);

      browser.ignoreSynchronization = false;

      // submit the patient registration form
      FU.buttons.submit();

      done();
    });

  // });

  function patientRegistrationDate(count) {
    let registrationDate = moment(date).add(count, 'day');
    // date.setDate(date.getDate() + count);
    return registrationDate.toDate();
  }

  function patientDebtorGroup(count) {
    if (count <= 5) { return 'Guest House'; }
    else if (count <= 20) { return 'Organisme Non Gouvernemental'; }
    else if (count <= 40) { return 'REGIDESO'; }
    else if (count <= 60) { return 'SNEL'; }
    else { return 'Patient Payant Cash'; }
  }

});
