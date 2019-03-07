# Exchange rates aggregating
## Overview

Implement application for gathering of exchange rates.

**Main requirement:** Application should be implemented using OOP principles.

Application may be implemented on any scripting language with or without usage of frameworks.

## Description of business logic

Application performs gathering of exchange rates for EUR relative to AUD, NOK and USD. Architecture should allow easily add or remove relative currencies through app config. Application uses several different sources of information. Each source has specific format of data:

1. https://currencylayer.com/documentation (JSON)

   Provided API Keys doesn't allow to retrieve EUR rates directly, thus EUR rate should be calculated through USD.

2. https://docs.openexchangerates.org/ (JSON)

3. http://www.floatrates.com/daily/usd.xml (XML)

   Tip: in some browsers to see XML structure you will need to open source of page.

   Open URL, then choose "View Page Source" from context menu

Example of application output:

|   |openexchangerates.org|...|...|
|---|---|---|---|
|AUD|1.1|1.2|1.3|
|USD|1.2|1.2|1.3|
|NOK|1.2|1.2|1.3|

## Hints for application architecture

Same, as in real world in this application you can operate by certain objects. Here is several tips regarding to main OOP principles:

* **Abstraction:** break down app to abstraction layers. For example generation of final HTML for output - it is distinct abstract level, which preferably should be separated from other business logic.
* **Polymorphism:** in this app certain classes have common interface, but different behavior.
* **Inheritance:** certain classes have functionality, which is common for each of them.
* **Encapsulation:** take care of code isolation in classes, defining interface intended for external usage.

Other advices:

* External APIs may require secrets, which should be stored in a separate config file or environment variable (security considerations).

## Usage

* `git clone`

* `bundle install`

* create `.env` file at project`s root directory

```
CURRENCY_LAYER_API_KEY=<ACCESS_KEY>
OPEN_EXCHANGE_RATES_API_KEY=<APP_ID>
```

* `rake rates:html[eur,aud,nok,usd]` generates HTML file in `output` folder with current date and time as a file name.
