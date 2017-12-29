// Usage
// yarn add puppeteer
// node puppeteer_sample.js

const puppeteer = require('puppeteer');

puppeteer.launch({
  headless: false, // フルバージョンのChromeを使用
  slowMo: 300      // 何が起こっているかを分かりやすくするため遅延
}).then(async browser => {
  const page = await browser.newPage();

  await page.setViewport({ width: 1200, height: 800 }); // view portの指定
  await page.goto('https://www.google.co.jp/');
  await page.type('#lst-ib', 'KitchHike, Inc');
  await page.click('.lsb');

  await page.waitFor(3000); // デモのための遅延

  await page.goto('https://kitchhike.com/');
  await page.waitFor(1000);
  await page.goto('https://kitchhike.com/jp/popups');
  await page.waitFor(3000);

  browser.close();
  browser.close();
});
