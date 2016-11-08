const FU = require('../../latest/test/end-to-end/shared/FormUtils');

it('Logs in', function (done) {
browser.get('http://localhost:8080/#/login');

element(by.model('LoginCtrl.credentials.username')).sendKeys('admin');
element(by.model('LoginCtrl.credentials.password')).sendKeys('admin');
FU.select('LoginCtrl.credentials.project', 'Hospital');

element(by.css('[data-method="submit"]')).click();
done();
});
