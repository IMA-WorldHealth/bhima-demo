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
const GU = require(root('GridUtils'));
const components = require(root('components'));
const helpers = require(root('helpers'));

helpers.configure(chai);

describe.only('Generate Cashflow', () => {
  'use strict';

  var details = JSON.parse(browser.params.details);

  it('Creates a new record', function () {

    helpers.navigate('#/reports/cashflow');

    FU.buttons.create();

    FU.input('ReportConfigCtrl.label', details.reportDate.concat(' Weekly USD Cash Movement'));
    element(by.css('[data-date-range="week"]')).click();

    FU.radio('ReportConfigCtrl.weekly', 0);

    FU.select('ReportConfigCtrl.cashbox', 'Hospital Primary Cashbox $');

    FU.buttons.submit();
    GU.expectRowCount('report-grid', details.totalReports);
  });

});

