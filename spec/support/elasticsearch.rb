 require 'rake'
    require 'elasticsearch/extensions/test/cluster/tasks'
    require 'elasticsearch/transport'   # This may not be needed, but I think if you get an error, it helps messaging.

    RSpec.configure do |config|

      ## 
      # Elasticsearch is slow to start up test clusters so only do it when elasticsearch: true
      # 
      # Example rspec implementation.
      # RSpec.describe Model, elasticsearch: true, type: :model do
      #   testing code
      # end
      config.before :all, elasticsearch: true do
        Elasticsearch::Extensions::Test::Cluster.start unless Elasticsearch::Extensions::Test::Cluster.running?
      end

      ##
      # Keep the clusters running until the entire test suite is done.
      config.after :suite do
        Elasticsearch::Extensions::Test::Cluster.stop if Elasticsearch::Extensions::Test::Cluster.running?
      end


      # Create indexes for all elastic searchable models on an as need basis
      config.before :each, elasticsearch: true do
        ActiveRecord::Base.descendants.each do |model|
          if model.respond_to?(:__elasticsearch__)
            begin
              # Create a new client for the model, otherwise it continues to try and use port :9200
              model.__elasticsearch__.client =  Elasticsearch::Client.new url: 'http://localhost:9250'
              model.__elasticsearch__.create_index!
              model.__elasticsearch__.refresh_index!
            rescue => Elasticsearch::Transport::Transport::Errors::NotFound
              # This kills "Index does not exist" errors being written to console
              # by this: https://github.com/elastic/elasticsearch-rails/blob/738c63efacc167b6e8faae3b01a1a0135cfc8bbb/elasticsearch-model/lib/elasticsearch/model/indexing.rb#L268
            rescue => e
              STDERR.puts "There was an error creating the elasticsearch index for #{model.name}: #{e.inspect}"
            end
          end
        end
      end

      # Delete indexes for all elastic searchable models to ensure clean state between tests
      config.after :each, elasticsearch: true do
        ActiveRecord::Base.descendants.each do |model|
          if model.respond_to?(:__elasticsearch__)
            begin
              model.__elasticsearch__.delete_index!
            rescue => Elasticsearch::Transport::Transport::Errors::NotFound
              # This kills "Index does not exist" errors being written to console
              # by this: https://github.com/elastic/elasticsearch-rails/blob/738c63efacc167b6e8faae3b01a1a0135cfc8bbb/elasticsearch-model/lib/elasticsearch/model/indexing.rb#L268
            rescue => e
              STDERR.puts "There was an error removing the elasticsearch index for #{model.name}: #{e.inspect}"
            end
          end
        end
      end
    end