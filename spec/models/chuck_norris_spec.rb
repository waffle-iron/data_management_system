require 'rails_helper'

RSpec.describe ChuckNorris, type: :model do
  it { should respond_to :fact }
  it { should respond_to :knockouts }
end

