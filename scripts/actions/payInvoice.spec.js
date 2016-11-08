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

helpers.configure(chai);

describe.only('Pay Invoice', () => {
  'use strict';


  it('Makes a payment against an invioce', function () {
  helpers.navigate('#/cash/1');
  var CURRENCY_USD = 2;
  var currency = CURRENCY_USD;
  // Pass this in
  var invoice = JSON.parse(browser.params.invoice);
  // var invoice = {
    // patientId : 'HSP1',
    // amount : 10
  // };


  console.log('INVOICE');
  console.log(invoice);
  var gridId = 'debtorInvoicesGrid';

  // select the proper patient
  components.findPatient.findById(invoice.patientId);

  // select the proper date
  // components.dateEditor.set(mockInvoicesPayment.date);

  // select the "invoices payment" option type
  var cautionOption = element(by.css('[data-caution-option="0"]'));
  cautionOption.click();

  // open the invoices modal to select various invoices
  // FU.exists(by.css('[data-open-invoices-btn]'), true);
  element(by.css('[data-open-invoices-btn]')).click();

  // be sure that the modal opened
  // FU.exists(by.css('[data-debtor-invoices-modal]'), true);

  // inside the modal, we want to select the first row to pay against
  const row = GU.selectRow(gridId, 0);

  // submit the modal
  FU.modal.submit();

  // select the USD currency from the currency radio buttons
  components.currencySelect.set(currency);

  // enter the amount to pay for an invoice
  components.currencyInput.set(invoice.cost);

  // click the submit button
  FU.buttons.submit();

  // expect the receipt modal to appear
  // FU.exists(by.id('receipt-confirm-created'), true);

  // dismiss the modal
  $('[data-action="close"]').click();
  });
});
