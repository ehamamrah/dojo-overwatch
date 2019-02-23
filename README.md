# DOJO Overwatch API's Wrapper
[![Build Status](https://travis-ci.org/ehamamrah/dojo-overwatch.svg?branch=master)](https://travis-ci.org/ehamamrah/dojo-overwatch)
- Getting Started:
    - [ Index All Heros ]
        * get '/api/heros'
    - [ Show Hero ]
        * get '/api/heros/[id]'
    - [ Show Hero Abilities ]
        * get '/api/heros/[id]/abilities'
    - [ Index All Abilities ]
        * get '/api/abilities'
    - [Show Ability]
        * get '/api/abilities/[id]'

- What's Done
    * Using **services** to fetch Heros & Abilities through API request
    * Parsing fetched data and save it to Data Base
    * Testing using **RSpec**
    * Admin Panel Implemented using **Active Admin** link: '/admin' **No user required**
    * Deployed to **Heroku**
    * **DOJO Overwatch On Docker**
    * Building tests are running using **TravisCI**

- Testing
    - Model & Controller Tests written with RSpec.
        - For testing: bundle exec rspec
        - **Controller Specs are inside spec/requests/**

- Docker
  - run the command: **docker-comopse up**

- Deployment
  - App deployed to heroku link: **'https://dojo-overwatch.herokuapp.com/'**
  - **Note:** the root path is heros#index to avoid showing error page
