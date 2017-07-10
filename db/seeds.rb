# Creates admin user
puts "Creating users..."
# Creates three agent users (one of which is admin)
agent1 = User::Agent.create!({ email: 'agent1@test.com', password: '123456' })
agent2 = User::Agent.create!({ email: 'agent2@test.com', password: '123456' })
admin = User::Agent.create!({ email: 'admin@test.com', password: '123456', admin: true })

# Creates two customer users
customer1 = User::Customer.create!({ email: 'customer1@test.com', password: '123456' })
customer2 = User::Customer.create!({ email: 'customer2@test.com', password: '123456' })
puts "Users created! Yah!"

puts "Creating tickets..."

User::Customer.all.each do |customer|
  2.times do |i|
    Ticket.create!( title: "Ticket #{i+1} - User #{customer.email}", customer: customer )
  end
end

puts "Tickets created! Uhoo!"
