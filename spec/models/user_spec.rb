require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  describe "attributes" do
    let(:user) { build(:user) }

    describe "active" do
      it 'has default value "true"' do
        expect(user.active).to be_truthy
      end
    end

    describe "admin" do
      it 'has default value "false"' do
        expect(user.admin).to be_falsy
      end
    end
  end
end
