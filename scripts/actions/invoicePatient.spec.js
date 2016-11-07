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
    helpers.navigate(invoice_path);

      // array of random inventory
      // var data = [
        // { invoice: '110001', qte: 5 }, { invoice: '100102', qte: 100 }, { invoice: '100095', qte: 10 },
        // { invoice: '150061', qte: 10 }, { invoice: '170449', qte: 1 }, { invoice: '110006', qte: 1 }
      // ];
      //
      var data = invoiceDetails.inventoryItems;

      var invoice = data[Math.floor(Math.random() * data.length)];

      var page = new PatientInvoicePage();

      // prepare the page with default patient, service, etc
      // FIXME: CLQ MUST BE THE SELECTED PROJECT

      // CLQ1
      var pid = invoiceDetails.patient.pid;

      page.details(pid, new Date(), `Invoice for a patient`);

      // add two inventory items to each row (0-indexing)
      page.addInventoryItem(0, invoice.invoice);

      // change the required quantities
      page.adjustItemQuantity(0, invoice.qte);

      // submit the page
      page.submit();

      page.reset();
  });
});
