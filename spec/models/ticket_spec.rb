require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :customer_id }
  end

  describe "relationships" do
    it { should belong_to(:agent) }
    it { should belong_to(:customer).class_name('User::Customer') }
    it { should have_many(:messages) }
  end

  describe "methods" do
    describe ".closing" do
      it "sets closed_at attribute" do
        subject.close = true

        expect {
          subject.valid?
        }.to change(subject, :closed_at).from(nil).to(Date.current)
      end

      it "doesn't set closed_at attribute when it has already been set" do
        subject.close = true
        subject.closed_at = 3.days.ago

        expect {
          subject.valid?
        }.not_to change(subject, :closed_at)
      end
    end
  end
end
