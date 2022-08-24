## Project Name: GeolocApi

Tech:

`Rails version             '6.0.5.1'`

`Ruby version              'ruby 2.7.6p219 (2022-04-12 revision c9c2245c0a[x86_64-darwin19]'`

`RubyGems version          '3.1.6'`

`Rack version              '2.2.4'`

`Database adapter          'postgresql'`


## Overview:
Welcome to GeolocApi, the best Geolocation API on the internet...

## App Data & Structure

### `DataIp model`(For geolocation data)
=============

associations    =>    belongs_to :data_type

attributes      =>    :ip_address, :ip_type, :continent_code,
                      :continent_name, :country_code, :country_name,
                      :region_code, :region_name, :city,
                      :zip, :data_type_id

### `DataType model` <small>(For categorizing geolocation)</small>
===========

associations    =>    has_many :data_ips

attributes      =>    :name_type

### `ApiUser model`(For authorized access) <!-- No implemented yet -->
===========

associations    =>    

attributes      =>    :name, :password_digest

## Test Rspec

- Spec/factories:
  - data_ip.rb
  - data_type.rb

- Spec/requests:
  - data_ips_spec
  - data_types_spec

- Spec/models:
  - data_ip_spec
  - data_type_spec

- Spec/support/Steps:  (turnip) <!-- No implemented -->

## Modules

• Geolocation - To retrieve data from the IpStack API service provider

## List of relevant gems

• for testing
* gem `'rspec-rails'`
* gem `"turnip"`     <!-- No implemented -->
* gem `'database_cleaner'`
* gem `'shoulda-matchers'`

• for populating data
* gem `"faker"`
* gem `"factory_bot_rails"`

• For authorization & authentication
* gem `'devise'`    <!-- No implemented -->
* gem `"can can"`   <!-- No implemented -->

• for database (All environments)
* gem `pg` - postgresql

## Deployment
* Heroku

## Challenges

The biggest challenge was to find a way to store the data-objects obtained (based on IP_ADDRESS) into the DB. Still, not working properly.

## Local Setup

1. Clone repo: 
  `git clone https://github.com/dangerrg/geolocapi.git`

2. Install all dependencies:
  `bundle install`

3. Setup DB
  `rails db:create db:migrate`
   OR
  `rails db:setup`

4. Seed development DB
  `rails db:seed`
 
5. Start the server
  `rails s`
 
6. Open <a href="https://www.postman.com/downloads/">Postman</a> and start testing the following <a href="https://github.com/dangerrg/geolocapi/edit/main/README.md#test-endpoints">endpoints</a>

## Test Endpoints
`localhost` => `http://localhost:3000`

`Postman`

| EndPoints                      |  Functionalities               |
|--------------------------------|--------------------------------|
|                                |                                |
| GET    /api/v1/data_types      |  Get all data_types            |
| POST   /api/v1/data_types      |  Add a data_type               |
| DELETE /api/v1/data_types/:id  |  Delete a data_type            |
| GET    /api/v1/data_ips        |  Get all data_ips              |
| POST   /api/v1/data_ips        |  Add a data_ip                 |
| GET    /api/v1/data_ips/:id    |  Get a data_ip                 |
| DELETE /api/v1/data_ips/:id    |  Delete a data_ip              |

7. For running tests:
  `RAILS_ENV=test rails db:migrate`
  `bundle exec rspec`

Your all set!


## Missing implementations
• App security (Authentication & Authorization)
  - It will be a simple user with attributes:
    - `:name`     => AUTH_USERNAME
    - `:password` => SECURE_PASSWORD
    - (ENV_VARS will be available only for the respective DEV team to consume the private api)

• Dockerize application for easy setup environment

## Future implementations
- Integrate a frontend framework like (React, Vue, etc...)
- Feature tests
- To update the service provider, just need to change the `ENV_VARS` values in the `application.yml` file.
