# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.connection.truncate(:companies)
ActiveRecord::Base.connection.reset_pk_sequence!('companies')
Company.create!(name: 'BNK', address: 'Ha Noi')
ActiveRecord::Base.connection.truncate(:permissions)
ActiveRecord::Base.connection.reset_pk_sequence!('permissions')
Permission.create!(name: 'Admin')
Permission.create!(name: 'Manage')
Permission.create!(name: 'Hr')
Permission.create!(name: 'Learder')
Permission.create!(name: 'Staff')
