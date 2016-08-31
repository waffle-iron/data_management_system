##
# Simple serializer for hashes so they are always given with indifferent access.
class HashSerializer
  
  # Does nothing, but needed for completeness of the serializer.
  # 
  # @param hash [Hash] the hash to persisted
  # # @return [Hash] just the hash
  def self.dump(hash)
    hash
  end

  # When the hash is requests, give it with indifferent access.
  # 
  # @param hash [Hash] the stored hash
  # @return [Hash] with indifferent access
  def self.load(hash)
    (hash || {}).with_indifferent_access
  end
end