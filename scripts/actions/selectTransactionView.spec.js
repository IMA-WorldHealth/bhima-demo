const path = require('path');
const _root = '../../latest/test/end-to-end/shared/';

function root(key) {
  return path.join(__dirname, _root, key);
}


const chai = require('chai');
const expect = chai.expect;

const FU = require(root('FormUtils'));
const GU = require(root('gridTestUtils.spec.js'));
const components = require(root('components'));
const helpers = require(root('helpers'));

const JournalPage = require(root('../journal/journal.page'));

const journal = new JournalPage();

helpers.configure(chai);

describe.only('Grouping', () => {
  'use strict';

  it('Selects grouping option for default', function () {
    components.notification.hasWarn();
    helpers.navigate('#/journal');
    $('[data-method="grouping"]').click();
  });

  // it('Disables cash window from opening scan page by default', function () {
    // helpers.navigate('#/cash/1');
    // element(by.model('CashCtrl.openBarcodeModalOnSuccess')).click();
  // });
});
