# Series25

A Ruby client wrapper for CollegeNet's Series25 web services API.

## Installation

Add this line to your application's Gemfile:

    gem 'series25'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install series25

## Usage

First create a new client to your own instance of Series25 web services.

```ruby
client = Series25::Client.new do |config|
  config.base_url = Rails.application.secrets.web_services_url
  config.user     = Rails.application.secrets.web_services_user
  config.password = Rails.application.secrets.web_services_password
end
```

You can then query event objects like so.

```ruby
  # This gives you a list of events
  events = client.events(query_id: 100) # Or whatever query_id you have set up

  # This gives you an individual event
  event = client.event(event_id: '345135')

  # All the nodes in the webservices xml are now methods
  event.event_id # => '345135'
  event.event_title # => 'My awesome event'

  # If there are more than one node with a name, the method is pluralized
  # and returns an array of those objects.
  event.profiles # => [<Series25::Profile>, ...]
```

## Contributing

#### Adding a Series25 Class

Just add the class to the /lib/series25 folder and make sure that it's name can easily be plualized (adding one 's').  If it is not that simple, add it to the /lib/series25/special_plurals.rb file.


#### Pull Requests

1. Fork it ( https://github.com/[my-github-username]/series25/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
