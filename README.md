# Currency Converter

A Flutter app that converts an amount between seven currencies using a fixed rate table. The result updates as you type, change a currency or tap the swap button, so there is no convert button.

## Running it

You need Flutter 3.10 or newer. From the project folder, run:

```bash
flutter create .
flutter pub get
flutter run -d chrome
```

`flutter create .` only adds the platform folders and leaves the code alone. Run `flutter test` to check everything passes.

## How it's organised

- `lib/models` holds the `Currency` class.
- `lib/data` holds the currency list and the rate table.
- `lib/logic` does the conversion and number formatting. It has no Flutter code, so it can be tested on its own.
- `lib/widgets` has the amount field, currency picker, swap button and result card.
- `lib/screens` puts those widgets together and holds the state.
- `test` has unit tests for the logic and widget tests for the screen.

## Design

The colours match the CampusLink design system from my Figma prototype. The deep teal (#0E4D64) is used for the result card so the converted amount is the most prominent thing on screen, and the amber accent (#FFB547) on the swap button picks up the ring in the CampusLink logo. All of the colours are defined once in the theme in `main.dart`, and every text colour meets the WCAG AA contrast ratio of 4.5:1.

## Exchange rates

Each rate is stored as the amount of that currency that equals 1 USD (for example GBP is 0.79 and JPY is 150). Any pair is worked out by dividing one rate by the other, so adding a currency only takes one new line. The values are samples, not live rates.

This is why the brief's swapped example comes out slightly differently. The brief rounds the reverse rate to 1.27 and gets 127.00, but the app uses the exact value of 1 / 0.79, so 100 GBP gives 126.58 USD. I kept the exact figure because it keeps every pair consistent.

## State management

The screen uses `setState` and only stores three things, the amount, the "from" currency and the "to" currency. The rate and the converted amount are calculated from those each time the screen rebuilds, so they can never show an old value.

## Edge cases

An empty field or a lone decimal point counts as 0. Letters, minus signs and a second decimal point can't be typed, and input is capped at 12 characters. Large results get thousand separators and shrink to fit the card. Picking the same currency twice gives a rate of exactly 1, and yen is shown without decimals.

## Tests

Run `flutter test` from the project folder. There are two test files.

`test/converter_test.dart` checks the conversion logic on its own. It covers the brief's worked example (100 and 200 USD to GBP), the swapped GBP to USD case, same-currency conversion, empty and invalid input, thousand separators, yen with no decimals, and rates shown without trailing zeros.

`test/widget_test.dart` checks the screen itself. One test types a new amount and confirms the result changes without pressing anything, and the other taps the swap button and confirms both the result and the rate line update.

## Limitations

The rates are fixed and will go out of date, and the currency list lives in code rather than coming from an API.