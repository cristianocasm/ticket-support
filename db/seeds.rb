# Creates admin user
puts "Creating users..."
# Creates three agent users (one of which is admin)
User::Agent.create!([
  {
    email: 'agent1@test.com',
    password: '123456'
  },
  {
    email: 'agent2@test.com',
    password: '123456'
  },
  {
    email: 'admin@test.com',
    password: '123456',
    admin: true
  }
])

# Creates two customer users
User::Customer.create!([
  {
    email: 'customer1@test.com',
    password: '123456'
  },
  {
    email: 'customer2@test.com',
    password: '123456'
  }
])
puts "Users created! Yah!"
