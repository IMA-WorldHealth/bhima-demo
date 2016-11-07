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



});
