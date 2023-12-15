puts 'Seeding the database ...'

puts 'Adding the admin user ...'

User.create(email: 'admin@test.com', password: 'admintest', is_admin: true)

puts 'Added user ...'
