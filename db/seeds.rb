# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Plan.create(name: 'free', price: 0)
Plan.create(name: 'basic', price: 64)
Plan.create(name: 'medium', price: 112)
Plan.create(name: 'intensive', price: 164)
Plan.create(name: 'basico', price: 1120)
Plan.create(name: 'intermedio', price: 2080)
Plan.create(name: 'intensivo', price: 3060)