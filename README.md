# API Simple Call
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
    * Using services to fetch Heros & Abilities through API request
    * Parsing fetched data and save it to Data Base
    * Testing using RSpec
    * Admin Panel Implemented using Active Admin link: '/admin' **No user required**


- Testing
    - Model & Controller Tests written with RSpec.
        - For testing: bundle exec rspec
        - **Controller Specs are inside spec/requests/**
