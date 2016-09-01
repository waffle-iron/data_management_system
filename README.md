[![Stories in Ready](https://badge.waffle.io/olendorf/data_management_system.png?label=ready&title=Ready)](https://waffle.io/olendorf/data_management_system)
[![Build Status](https://travis-ci.org/olendorf/data_management_system.svg?branch=develop)](https://travis-ci.org/olendorf/data_management_system)
[![Coverage Status](https://coveralls.io/repos/github/olendorf/data_management_system/badge.svg)](https://coveralls.io/github/olendorf/data_management_system)
[![Dependency Status](https://gemnasium.com/badges/github.com/olendorf/data_management_system.svg)](https://gemnasium.com/github.com/olendorf/data_management_system)
[![Code Climate](https://codeclimate.com/github/olendorf/data_management_system/badges/gpa.svg)](https://codeclimate.com/github/olendorf/data_management_system)


### Data Management Tool

Right now this is just a playground for me to try ideas mostly building off things I've
built for researchers and myself.

### RSpec Testing
Testing the elasticsearch features can be slow, so they are turned off by default 
using [test filtering](https://www.relishapp.com/rspec/rspec-core/v/2-4/docs/filtering). For 
this to work, most tests should be run as `fast: true`. Tests that are slow should be tagged 
with `slow: true`. If they test also requires an Elasticsearch testing cluster to 
be started it should be tagged with `elasticsearch: true`. The code snippet shows usage.

```ruby
  require 'rails_helper'
  
  ##
  # This test will be run by default.
  RSpec.describe Model::Name, fast: true, type: :model do
    # tests
  end
  
  ##
  # Include this test will only be run when the slow tag is sent
  RSpec.describe Model::Name, slow: true, type: :model do
    # tests
  end
  
  ##
  # This will also ensure a test Elasticsearch cluster is started.
  RSpec.describe Model::Name, slow: true, elasticsearch: true type: :model do
    # tests
  end
```

The strategy is to put all the fast tests in one `RSpec.describe` block and
all the slow, elasticsearch tests in another. 

To run the tests do the following.

```bash
    $ rspec  #runs the fast tests
    $ rspec --tag slow   # runs all the tests, and creates a test cluster if needed.
```