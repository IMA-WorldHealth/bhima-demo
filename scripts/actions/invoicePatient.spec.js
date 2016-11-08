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
const PatientInvoicePage = require(root('../patient/invoice/invoice.page.js'));

helpers.configure(chai);


describe.only('Invoice Patient', () => {
  'use strict';

  const invoice_path = '#/invoices/patient';

  var invoiceDetails = JSON.parse(browser.params.invoiceDetails);

  it('Invoices a patient', function () {
    // helpers.navigate(invoice_path);
    browser.get('#/invoices/patient');

    var data = invoiceDetails.inventoryItems;

    console.log(data);
    console.log(typeof data);

    // var item = data[Math.floor(Math.random() * data.length)];

    var page = new PatientInvoicePage();

    // prepare the page with default patient, service, etc
    // FIXME: CLQ MUST BE THE SELECTED PROJECT

    var pid = invoiceDetails.patient.pid;
    // page.details(pid, new Date(), `Invoice for a patient`);

    page.patient(pid);
    FU.input(
        'PatientInvoiceCtrl.Invoice.details.description',
        `Invoicing patient ${pid}`
      );

    browser.ignoreSynchronization = true;
    page.addRows(data.length - 1);
    data.forEach(function (item, index) {
      // add two inventory items to each row (0-indexing)
      page.addInventoryItem(index, item.code);

      // change the required quantities
      // page.adjustItemQuantity(0, invoice.qte);
      page.adjustItemQuantity(index, item.quantity);
    });
    // submit the page
    //
    browser.ignoreSynchronization = false;
    page.submit();

    page.reset();
  });
});
