require 'rails_helper'

RSpec.describe User::Agent, type: :model do
  describe "attributes" do
    it_should_behave_like "a user model" do
      let(:model) { create(:agent) }
    end
  end

  describe "relationships" do
    it { should have_many(:tickets).with_foreign_key(:agent_id) }
    it { should have_many(:messages).with_foreign_key(:agent_id) }
  end
end
