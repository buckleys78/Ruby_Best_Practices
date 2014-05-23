# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# .bashrc    echo $SIMPLE_PASS
#User.create!(email: buckleys78@gmail.com, password: ENV["SIMPLE_PASS"], password_confirmation: ENV["SIMPLE_PASS"])

# rake db:seed

@editor = User.create(email: 'editor@example.com',
                      password: 'asdfasdf',
                      password_confirmation: 'asdfasdf',
                      role: 'editor')

@author = User.create(email: 'author@example.com',
                      password: 'asdfasdf',
                      password_confirmation: 'asdfasdf',
                      role: 'author')

@visitor = User.create(email: 'visitor@example.com',
                       password: 'asdfasdf',
                       password_confirmation: 'asdfasdf')
