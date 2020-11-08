# README

## Booking activities API
This API has 3 modules: Authentication, Admin, User
* Admin module allows to list, create and schedule activities
* User module allows to list and book existing activities
* The Authentication module has the basic 3 actions: signUp, signIn and signOut

## API Architecture
The API has a layered architecture:
- Models
- Services
- Representers
- Policies
- Controller
- Views

Things you may want to cover:

* Ruby version `2.7.2`

* Database set up
  ```
  rails db:create
  rails db:migrate
  rails db:seed
  ```

* How to run the test suite
  ```
  rails test
  ```

* How to run local server
  ```
  rails s
  ```

* Services used:
  - `ActionMailer::MailDeliveryJob`
