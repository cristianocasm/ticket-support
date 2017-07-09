class User::Customer < User
  has_many :tickets,  foreign_key: :customer_id
  has_many :messages, foreign_key: :customer_id
end
