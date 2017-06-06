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

const ComplexVoucherPage = require(root('../vouchers/complex.page'));

helpers.configure(chai);

describe.only('Transfer Cash', () => {
  'use strict';

  it('Pays the water bill', function () {
    helpers.navigate('#/vouchers/complex');

    browser.refresh();
    const page = new ComplexVoucherPage();

    const WATER_BILL = 20;
    const voucher = {
      date : new Date(),
      // TODO add date and account info to description
      description : 'Monthly water bill',
      rows : [

        // water - 60511010
        // electricity - 60521010
        { account : '60511010', debit: WATER_BILL, credit: 0},
        { account : 'Caisse Principale USD', debit: 0, credit: WATER_BILL},
      ]
    };

    // configure the date to today
    // page.date(voucher.date);

    // browser.ignoreSynchronization = true;
    // set the description
    page.description(voucher.description);

    // set the currency to USD
    page.currency(2);

    // page.addRow();

    // loop through each row and assign the correct form values
    voucher.rows.forEach((row, idx) => {
      let current = page.row(idx);
      current.account(row.account);
      current.debit(row.debit);
      current.credit(row.credit);
      if (row.entity) {
        current.entity(row.entity.type, row.entity.name);
      }
      if (row.reference) {
        current.reference(row.reference.type, row.reference.index);
      }
    });

    /*
     * set the transfer type to one which have a specific Id
     * (e.g. cash payment Id is 1)
     * @see client/src/js/services/VoucherService.js
     */
    page.transactionType("Autres Depenses");

    // browser.ignoreSynchronization = false;
    // submit the page
    page.submit();

    // expect a successful notification
    // components.notification.hasSuccess();
    // make sure a receipt was opened
    FU.exists(by.id('receipt-confirm-created'), true);

    // close the modal
    $('[data-method="close"]').click();
  });

  it('Pays an electricity bill', function () {
    helpers.navigate('#/vouchers/complex');
    browser.refresh();
    const page = new ComplexVoucherPage();

    const ELECTRICITY_BILL = 50;
    const voucher = {
      date : new Date(),
      // TODO add date and account info to description
      description : 'Monthly payment for electricity',
      rows : [

        // water - 60511010
        // electricity - 60521010
        { account : '60521010', debit: ELECTRICITY_BILL, credit: 0},
        { account : 'Caisse Principale USD', debit: 0, credit: ELECTRICITY_BILL},
      ]
    };

    page.description(voucher.description);

    page.currency(2);

    // loop through each row and assign the correct form values
    voucher.rows.forEach((row, idx) => {
      let current = page.row(idx);
      current.account(row.account);
      current.debit(row.debit);
      current.credit(row.credit);
      if (row.entity) {
        current.entity(row.entity.type, row.entity.name);
      }
      if (row.reference) {
        current.reference(row.reference.type, row.reference.index);
      }
    });

    page.transactionType("Autres Depenses");

    page.submit();

    FU.exists(by.id('receipt-confirm-created'), true);
    $('[data-method="close"]').click();
  });

});

