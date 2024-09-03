require_relative 'orm'

class User < ORM
  column :name, 'TEXT'
  column :email, 'TEXT'
  
  # Call setup_table to ensure the table is created
  setup_table
end
