class ChuckNorris < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks   # Automatically indexes objects

  serialize :kungfu, HashSerializer
end
