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

helpers.configure(chai);

describe.only('Patient Registration', () => {
  'use strict';

  const path = '#/patients/register';
  beforeEach(() => helpers.navigate(path));

  var patient = JSON.parse(browser.params.patient);

  const TOTAL_ITEMS = 2;

  let item = patient;

  // patients.forEach((item, index) => {

    it(`Register patient`, function () {

      browser.ignoreSynchronization = true;
      // patient name
      FU.input('PatientRegCtrl.medical.display_name', item.name);


      // hospital number and yob
      item.hospital_no = item.hospital_no;
      FU.input('PatientRegCtrl.medical.hospital_no', item.hospital_no);
      FU.input('PatientRegCtrl.medical.dob', '01-01-'.concat(item.yob));


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
      let debtorGroup = patientDebtorGroup();
      FU.uiSelect('PatientRegCtrl.finance.debtor_group_uuid', debtorGroup);

      browser.ignoreSynchronization = false;

      // submit the patient registration form
      FU.buttons.submit();

      expect(element(by.css('[data-action="close"]')).isPresent()).to.eventually.equal(true);
      $('[data-action="close"]').click();
      // done();
    });

  // });

  function patientRegistrationDate(count) {
    let registrationDate = moment(date).add(count, 'day');
    // date.setDate(date.getDate() + count);
    return registrationDate.toDate();
  }

  // TODO move this to demo file
  function patientDebtorGroup() {
    var selectIndex = _.random(0, 4);
    var paysCash = _.random(0, 1);

    if (paysCash) {
      return 'Patient Payant Cash';
    }

    var options = [
      'Guest House',
      'Organisme Non Gouvernemental',
      'REGIDESO',
      'SNEL',
      'Patient Payant Cash'
    ];

    return options[selectIndex];
  }

});
