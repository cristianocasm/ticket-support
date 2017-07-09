class Ticket < ApplicationRecord
  attr_accessor :close

  # RAILS BUG: it breaks when saving ticket if customer_id is set
  # and it is not marked as optional
  belongs_to :customer, class_name: 'User::Customer', optional: true
  belongs_to :agent,    class_name: 'User::Agent',    optional: true

  has_many :messages
  
  validates_presence_of :title
  validates_presence_of :customer_id

  validate :closing

  private

  def closing
    self.closed_at = Date.current if close && self.closed_at.blank?
  end
end
