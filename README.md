# Yito community plugin

It's a yito plugin to create a social network based on the user profiles

## Usage

Just include the gem dependency in your Gemfile and run bundle update

```ruby
gem "ysd_plugin_community"
```

It adds three new routes to the application:

* /community To discover other members
* /profile   To view my profile
* /profile/username To view another user profile

It defines the profile render, Renders::ProfileRender, which is responsible of
rendering a user profile