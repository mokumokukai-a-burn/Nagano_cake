# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(id: 1, name: 'test name1', price: '1000', opinion: '栃木県産のとちおとめを贅沢に使用しています。1')
Product.create(id: 2, name: 'test name2', price: '2000', opinion: '栃木県産のとちおとめを贅沢に使用しています。2')
Product.create(id: 3, name: 'test name3', price: '3000', opinion: '栃木県産のとちおとめを贅沢に使用しています。3')
Product.create(id: 4, name: 'test name4', price: '4000', opinion: '栃木県産のとちおとめを贅沢に使用しています。4')
# CartItem.create(id: 4, user_id: '4', product_id: '4', quantity: '4')
