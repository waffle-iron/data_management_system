require 'rails_helper'

# The fast: true tag allows us to set it up to run only these
# tests by default.
RSpec.describe ChuckNorris, fast: true, type: :model do
  it { should respond_to :kungfu }

  let(:charles) { create :chuck_norris }

  describe 'accessing the data with indifferent access' do
    it 'should index with a string as the key' do
      expect(charles.kungfu['fact']).to be_a_kind_of String
    end
    it 'should index with a symbol as the key' do
      expect(charles.kungfu[:fact]).to be_a_kind_of String
    end
  end
end


# Make sure and add elasticsearch: true. The slow tag allows us to run these only when needed.
RSpec.describe ChuckNorris, slow: true, elasticsearch: true, type: :model do


  describe 'elasticsearch indexing' do
    it 'should index the model into elasticsearch' do
      record = create :chuck_norris   # create a record
      ChuckNorris.import  # import the record

      ChuckNorris.__elasticsearch__.refresh_index!  # make sure the index is up to date

      terms = record.kungfu[:fact].split(' ')  # so we can search on a single term.
      expect(ChuckNorris.search(terms.sample).records.length).to eq 1
    end

  end
end

