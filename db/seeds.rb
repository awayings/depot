# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!(title: 'Programing Ruby 1.9 & 2.0',
                description: %{
                  <p>
                  Ruby is the fastest grouing and most exciting dynamci language.
                  </p>
                  },
                  image_url: 'ruby_jpg',
                  price: 49.22)
