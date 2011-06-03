Spree Acts As Edgy
==================

Connector to [acts_as_edgy](https://github.com/directededge/acts_as_edgy)


Intallation
===========

1. Add to Gemfile
    
        gem 'spree_acts_as_edgy', :git => 'git://github.com/romul/spree_acts_as_edgy.git'
    
1. Run `bundle install`
1. Install plugin [acts_as_edgy](https://github.com/directededge/acts_as_edgy)
1. Run `rake edgy:configure` (check generated initializer edgy.rb manually, username can be wrong detected)
1. Run `rake edgy:export`
1. Add to your views something like
    
        <%= edgy_related_table(:horizontal, :max_results => 5) %>
