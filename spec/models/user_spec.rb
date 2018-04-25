require 'rails_helper'

# RSpec.describe User, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User do

  context 'login validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(3) }
    it { should validate_uniqueness_of(:username) }
  end

  context 'email validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  context 'password validations' do
    it { should validate_length_of(:password).is_at_least(3) }
    it { should validate_presence_of(:password) }
  end

end