const FU = require('../../latest/test/end-to-end/shared/FormUtils');

it('Logs in', function () {
browser.get('http://localhost:7000/#/login');

element(by.model('LoginCtrl.credentials.username')).sendKeys('admin');
element(by.model('LoginCtrl.credentials.password')).sendKeys('admin');
FU.select('LoginCtrl.credentials.project', 'Hospital');

element(by.css('[data-method="submit"]')).click();
});
