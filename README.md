# _Shoe Tracker_

#### _This is a web application for tracking shoes. Sep 29, 2017_

#### By _**Karla Buckner**_

## Description

_In this web application, the user can add shoe stores and shoe brands. Shoe stores can be modified and deleted. Price can be added to brands. Existing brands can be added to a store, allowing the same brand to be sold at multiple stores. The user can also see all brands a store sells._

## Specifications

User can add a shoe store and the name will be capitalized.
* _Input: "foot locker"_
* _Output: "Foot Locker"_

User can edit a shoe store name
* _Store: "Foot Locker"_
* _Update: "Lady Foot Locker"_
* _Output: "Lady Foot Locker"_

User can delete a shoe store name
* _Store: "Foot Locker"_
* _Delete: "Foot Locker"_
* _Output:_

User can add a shoe brand and the name will be capitalized.
* _Input: "nike"_
* _Output: "Nike"_

User can add a shoe brand price and it will append in currency format.
* _Input: "90"_
* _Output: "$90.00"_

User can add an existing shoe brand to a store name.
* _Input from select menu: "Nike", "Adidas"_
* _Output for brands at store: "Nike", "Adidas"_

## Setup/Installation Requirements

* _Clone repository and navigate to root directory of project in terminal_
* _Run postgres_
* _Bundle gemfiles_
* _Rake create, migrate, prepare_
* _Run $ ruby app.rb_
* _Finally, enter http://localhost:4567/ in the browser._

## Known Bugs

_There are no known bugs at this time_

## Support and contact details

_Contact kmb2662@gmail.com if you have questions or feedback_

## Technologies Used

_Ruby Sinatra Capybara_

### License

*MIT License*

Copyright (c) 2017 **_Karla Buckner_**
