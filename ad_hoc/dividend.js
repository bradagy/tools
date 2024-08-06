import readline from "readline";

import axios from "axios";
import cheerio from "cheerio";
import puppeteer from "puppeteer";

// const rl = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout,
// });

// This is the URL for a ticker's dividend page: https://www.nasdaq.com/market-activity/stocks/${nameOfTicker}/dividend-history

// const ticker = function submitTickerInformation(nameOfTicker) {
//     //  rl.close();
//     const userAnswer = rl.question("Enter company's ticker information: ", (nameOfTicker) => {
//         fetch(nameOfTicker);
//         // openTickerDividendWebpage(nameOfTicker);
//         rl.close();
//     });
// };

const fetchingData = async function fetchingDataFromTickerNasdaqPage(nameOfTicker) {
    try {
        const response = await axios.get(
            `https://www.nasdaq.com/market-activity/stocks/${nameOfTicker}/dividend-history`
        );
        console.log("Response received");
        console.log(response.data);
    } catch (error) {
        console.log(error);
    }
};

// const openTickerDividendWebpage = async function (nameOfTicker) {
//     const browser = await puppeteer.launch({ headless: false });
//
//     const page = await browser.newPage();
//
//     try {
//         console.log("\nNavigating to ticker's dividend page\n");
//         const response = await page.goto(
//             `https://www.nasdaq.com/market-activity/stocks/${nameOfTicker}/dividend-history`
//         );
//         // Returns true if the HTTP status code is 200-299
//         console.log(`Success: ${response.ok()}`);
//     } catch (error) {
//         console.error("Navigation failed:", error);
//     }
//
//     // Close the browser after 10 seconds
//     setTimeout(async function () {
//         await browser.close();
//     }, 10000);
// };

//ticker();
fetchingData("wynn");
