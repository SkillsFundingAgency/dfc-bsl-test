var webdriver = require('selenium-webdriver');

// Input capabilities
var capabilities = {
  'browserstack.local' : 'true',
  'browserstack.localIdentifier' : '__browserStackIdentifier__',
  'browserName' : 'iPhone',
  'device' : 'iPhone 7',
  'realMobile' : 'true',
  'os_version' : '10.3',
  'browserstack.user' : '__browserStackUser__',
  'browserstack.key' : '__browserStackSecret__'
}

var driver = new webdriver.Builder().
  usingServer('http://hub-cloud.browserstack.com/wd/hub').
  withCapabilities(capabilities).
  build();

driver.get('__testUrl__').then(function(){
  driver.findElement(webdriver.By.name('q')).sendKeys('BrowserStack\n').then(function(){
    driver.getTitle().then(function(title) {
      console.log(title);
      driver.quit();
    });
  });
});