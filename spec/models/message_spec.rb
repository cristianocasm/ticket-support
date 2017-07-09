require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "validations" do
    it { should validate_presence_of :msg }
    it { should validate_presence_of :ticket }

    describe ".belongs_to_any" do
      it "adds error when it doesn't belong to a customer or agent" do
        subject.valid?

        expect(subject.errors.messages[:base]).to include("message must belong to somebody")
      end

      it "doesn't add error when it belong to a customer" do
        subject.customer_id = 1
        subject.valid?

        expect(subject.errors.messages[:base]).not_to include("message must belong to somebody")
      end

      it "doesn't add error when it belong to an agent" do
        subject.agent_id = 1
        subject.valid?

        expect(subject.errors.messages[:base]).not_to include("message must belong to somebody")
      end
    end
  end

  describe "relationships" do
    it { should belong_to :ticket }
    it { should belong_to(:agent).class_name('User::Agent') }
    it { should belong_to(:customer).class_name('User::Customer') }
  end
end
