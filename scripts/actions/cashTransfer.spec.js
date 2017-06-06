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


  var cashRecords = JSON.parse(browser.params.cashRecords);

  it('Exports cash from the cash window', function () {
    helpers.navigate('#/cash/1');

    // click the transfer button
    // const transferBtn = element(by.css('[data-perform-transfer]'));
    // transferBtn.click();

    $('[data-action="open-tools"]').click();
    $('[data-action="transfer"]').click();

    // choose USD as transfer currency
    components.currencySelect.set(2, 'transfer-currency-select');

    //set a value in the currency component by model to avoid conflict
    components.currencyInput.set(cashRecords.cashBoxAmount, 'transfer-currency-input');

    // submit the modal button
    FU.modal.submit();

    // make sure we have a success notification shown
    // components.notification.hasSuccess();
  });

  it('Generates a transfer from the tranfer account to the primary cash box to complete the transaction', function () {
    helpers.navigate('#/vouchers/complex');
    const page = new ComplexVoucherPage();

    const voucher = {
      date : new Date(),
      // TODO add date and account info to description
      description : 'Monthly transfer to primary cash box',
      rows : [

        // TODO As the previous transfer has just been made this will be the 0th index - this shouldn't be left to chance
        { account : 'Virement des fonds Caisse Auxiliaire - Caisse Principale USD', debit: 0, credit: cashRecords.cashBoxAmount, reference : { type : 'voucher', index : 0}},
        { account : 'Caisse Principale USD', debit: cashRecords.cashBoxAmount, credit: 0, reference : { type : 'voucher', index : 0 }},
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
    page.transactionType("Transfert d'argent");

    // browser.ignoreSynchronization = false;
    // submit the page
    page.submit();

    // expect a successful notification
    // components.notification.hasSuccess();
    // make sure a receipt was opened
    // FU.exists(by.id('receipt-confirm-created'), true);

    // close the modal
    $('[ng-click="ReceiptCtrl.close()"]').click();
  });
});

