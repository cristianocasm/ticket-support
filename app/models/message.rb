class Message < ApplicationRecord
  belongs_to :customer, class_name: 'User::Customer', optional: true
  belongs_to :agent,    class_name: 'User::Agent',    optional: true
  belongs_to :ticket

  validates_presence_of :msg
  validates_presence_of :ticket
  validate :belongs_to_any

  private

  def belongs_to_any
    self.errors.add(:base,
      "message must belong to somebody") if customer_id.blank? && agent_id.blank?
  end
end
