require_relative 'models'

# Creating a new user
user = User.new
user.name = 'John Doe'
user.email = 'john@example.com'

# Save to database
User.database.exec_params("INSERT INTO #{User.table_name} (name, email) VALUES ($1, $2)", [user.name, user.email])

# Fetching users
result = User.database.exec("SELECT * FROM #{User.table_name}")
result.each do |row|
  puts "User ID: #{row['id']}, Name: #{row['name']}, Email: #{row['email']}"
end
