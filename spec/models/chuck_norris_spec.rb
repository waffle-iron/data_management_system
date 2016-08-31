require 'rails_helper'

RSpec.describe ChuckNorris, type: :model do
  it { should respond_to :kungfu }

  let(:charles) { build :chuck_norris }

  describe 'accessing the data with indifferent access' do
    it 'should index with a string as the key' do
      expect(charles.kungfu['fact']).to be_a_kind_of String
    end
    it 'should index with a symbol as the key' do
      expect(charles.kungfu[:fact]).to be_a_kind_of String
    end
  end
end

