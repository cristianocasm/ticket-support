class User::Agent < User
  has_many :tickets,  foreign_key: :agent_id
  has_many :messages, foreign_key: :agent_id
end
