# API Simple Call
- Getting Started:
    * get '/api/v1/estates'      [index]
    * get '/api/v1/estates/[id]' [Show]
    * post '/api/v1/estates/', **Params are required** [Create]
    * patch '/api/v1/estates/[id]' **Params are required** [Update]
    * delete '/api/v1/estates/[id]' [Delete]

- What's Done
    * Using services to fetch Heros & Abilities through API request
    * Parsing fetched data and save it to Data Base
    * Testing using RSpec
    * Admin Panel Implemented using Active Admin link: '/admin' **No user required**


- Testing
    - Model & Controller Tests written with RSpec.
        - For testing: bundle exec rspec
        - **Controller Specs are inside spec/requests/**
