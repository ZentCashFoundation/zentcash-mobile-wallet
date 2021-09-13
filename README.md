# Zent Cash Mobile Wallet - A mobile, native Zent Cash Wallet

![Zent Cash](https://github.com/ZentCashFoundation/brand/blob/master/logo/wordmark/zentcash_wordmark_color.png "Zent Cash")

![Discord](https://img.shields.io/discord/527428494154792960?label=Discord%20-%20Zent%20Cash%20[ZTC])](https://discord.gg/tfaUE2G) 
[![GitHub issues](https://img.shields.io/github/issues/ZentCashFoundation/zentcash-mobile-wallet?label=Issues)](https://github.com/ZentCashFoundation/zentcash-mobile-wallet/issues)
[![GitHub contributors](https://img.shields.io/github/contributors-anon/ZentCashFoundation/zentcash-mobile-wallet?label=Contributors)](https://github.com/ZentCashFoundation/zentcash-mobile-wallet/graphs/contributors) 
[![GitHub All Releases](https://img.shields.io/github/downloads/ZentCashFoundation/zentcash-mobile-wallet/total?label=Downloads)](https://github.com/ZentCashFoundation/zentcash-mobile-wallet/releases) 
![Version](https://img.shields.io/github/v/release/ZentCashFoundation/zentcash-mobile-wallet)

### Initial Setup

* `cd zentcash-mobile-wallet`
* `yarn install`

### Running

* `node --max-old-space-size=8192 node_modules/react-native/local-cli/cli.js start` (Just need to run this once to start the server, leave it running)
* `react-native run-android`

### Logging

`react-native log-android`

### Creating a release

You need to bump the version number in:

* `src/Config.js` - `appVersion`
* `android/app/build.gradle` - `versionCode` and `versionName`
* `package.json` - `version` - Not strictly required
* Update user agent in `android/app/src/main/java/com/tonchan/MainApplication.java` and `android/app/src/main/java/com/tonchan/TurtleCoinModule.java`

Then either run `yarn deploy-android`, or:

`cd android`

#### Create an AAB
`./gradlew bundleRelease`

#### Create an APK
`./gradlew assembleRelease`

#### Deploy to device
`./gradlew installRelease`

### Integrating QR Codes or URIs

Zent Cash Mobile Wallet supports two kinds of QR codes.

* Standard addresses / integrated addresses - This is simply the address encoded as a QR code.

* zentcash:// URI encoded as a QR code.

Your uri must begin with `zentcash://` followed by the address to send to, for example, `zentcash://Ze4tc4mTG137cG3i5oa8yLAW4iZvPoRVsEx5dGRhiEcoEWEVCBvc4hB6fcDyqE2FoWPpLWnGGswq19yqsFi1bhDd1XnDmtD6T`

There are a few optional parameters.

* `name` - This is used to add you to the users address book, and identify you on the 'Confirm' screen. A name can contain spaces, and should be URI encoded.
* `amount` - This is the amount to send you. This should be specified in atomic units.
* `paymentid` - If not using integrated address, you can specify a payment ID. Specifying an integrated address and a payment ID is illegal.

An example of a URI containing all of the above parameters:

```
zentcash://Ze4tc4mTG137cG3i5oa8yLAW4iZvPoRVsEx5dGRhiEcoEWEVCBvc4hB6fcDyqE2FoWPpLWnGGswq19yqsFi1bhDd1XnDmtD6T?amount=10000&name=Starbucks%20Coffee&paymentid=537461726275636b7320436f6666656520202020202020202020202020202020
```

This would send `100 ZTC` (10000 in atomic units) to the address `Ze4tc4mTG137cG3i5oa8yLAW4iZvPoRVsEx5dGRhiEcoEWEVCBvc4hB6fcDyqE2FoWPpLWnGGswq19yqsFi1bhDd1XnDmtD6T`, using the name `Starbucks Coffee` (Note the URI encoding), and using a payment ID of `537461726275636b7320436f6666656520202020202020202020202020202020`

You can also just display the URI as a hyperlink. If a user clicks the link, it will open the app, and jump to the confirm screen, just as a QR code would function. (Provided all the fields are given)