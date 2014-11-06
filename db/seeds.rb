# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.create(email: "test_admin@yopeso.com", password: "testbookshelf", role: "admin")
User.create(email: "test_user@yopeso.com", password: "testbookshelf", role: "default")
@author1 = Author.create_from_name("George Clason")
@author2 = Author.create_from_name("Malcolm Gladwell")
@author3 = Author.create_from_name("Dale Carnegie")
@book1 = Book.create(title: "The Richest Man in Babylon", year: 1926, user_id: 1, author_id: 1)
@book1.genres << Genre.create_from_name("Financial")
@book2 = Book.create(title: "The Tipping Point ", year: 2000, user_id: 2, author_id: 2)
@book2.genres << Genre.create_from_name("Psychology, Sociology")
@book3 = Book.create(title: "Blink", year: 2005, user_id: 1, author_id: 2)
@book3.genres << Genre.create_from_name("Psychology, Sociology")
@book4 = Book.create(title: "Outliers", year: 2008, user_id: 2, author_id: 2)
@book4.genres << Genre.create_from_name("Psychology, Sociology")
@book5 = Book.create(title: "Public Speaking and Influencing Men in Business", year: 1926, user_id: 1, author_id: 3)
@book5.genres << Genre.create_from_name("Nonfiction, Biographies, Memoirs, Business, Investing")
@book6 = Book.create(title: "How to Win Friends and Influence People", year: 1936, user_id: 2, author_id: 3)
@book6.genres << Genre.create_from_name("Nonfiction, Biographies, Memoirs, Business, Investing")
@book7 = Book.create(title: "How to Stop Worrying and Start Living", year: 1948, user_id: 1, author_id: 3)
@book7.genres << Genre.create_from_name("Nonfiction, Biographies, Memoirs, Business, Investing")

