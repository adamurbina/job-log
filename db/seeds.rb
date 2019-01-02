# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user2 = User.create(username: 'Peckholdt', title: 'Director', split: 0.55 ,password: 'password', password_confirmation: 'password')
user3 = User.create(username: 'Smith', title:'Associate', split: 0.45, password: 'password', password_confirmation: 'password')

client1 = Client.create(company: 'ABC Corp', contact: 'Adam Adler')
client2 = Client.create(company: 'Real Estate Co.', contact: 'Alice Cooper')
client3 = Client.create(company: 'Flatiron Bank', contact: 'Kevin Flad')

job1 = Job.create(user: user2, client: client1, job_number: '2018-1', property_name: 'Miami Towers', fee: 5000, property_type: 'Residential')

job2 = Job.create(user: user2, client: client2, job_number: '2018-2', property_name: 'New York Center', fee: 7000, property_type: 'Office')

job3 = Job.create(user: user2, client: client2, job_number: '2018-3', property_name: 'One California Plaza', fee: 10000, property_type: 'Retail')

job4 = Job.create(user: user3, client: client3, job_number: '2018-4', property_name: '101 Ronkonkoma Place', fee: 3000, property_type: 'Office')

job5 = Job.create(user: user3, client: client3, job_number: '2018-5', property_name: 'West Islip Park', fee: 4000, property_type: 'Industrial')

job6 = Job.create(user: User.first, client: client1, job_number: '2018-6', property_name: 'Rando Place', fee: 5300, property_type: 'Mixed-Use')
