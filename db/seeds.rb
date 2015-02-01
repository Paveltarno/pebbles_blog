# Create admin user
name = ENV["ADMIN_USERNAME"]
password = ENV["ADMIN_PASSWORD"]
puts "Creating admin user #{name}/#{password}"
User.create!(name: name, password: password)