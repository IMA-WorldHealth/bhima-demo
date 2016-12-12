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
const GU = require(root('gridTestUtils.spec.js'));
const components = require(root('components'));
const helpers = require(root('helpers'));

const JournalPage = require(root('../journal/journal.page'));
const TrialBalancePage = require(root('../journal/trial_balance/trialBalance.page'));

const journal = new JournalPage();
const trialBalance = new TrialBalancePage();

helpers.configure(chai);

describe.only('Use the trial balance', () => {
  'use strict';


  it('Post all rows', function () {
    helpers.navigate('#/journal');

    clickHeaderCell('journal-grid', 1);
    // journal.checkRow(0);
    journal.openTrialBalanceModal();
    trialBalance.submitData();
  });

  function clickHeaderCell(gridId, colNumber) {
    var headerCell = getHeaderCell( gridId, colNumber);

    // NOTE: Can't do .click() as it doesn't work when webdriving Firefox
    return browser.actions().mouseMove(headerCell).mouseDown(headerCell).mouseUp().perform();
    // return headerCell.click();
  }

  function getHeaderCell(gridId, expectedCol, expectedValue) {
    return element(by.id(gridId)).element(by.css('.ui-grid-render-container-left')).element( by.css('.ui-grid-header') ).element( by.repeater('col in colContainer.renderedColumns track by col.uid').row( expectedCol)  );
  }
});
