# User creation
user1 = User.create(email: "test_admin@yopeso.com", password: "testbookshelf", role: "admin")
user2 = User.create(email: "test_user@yopeso.com", password: "testbookshelf", role: "default")
# Author creation
@author1 = Author.create_from_name("George Clason")
@author2 = Author.create_from_name("Malcolm Gladwell")
@author3 = Author.create_from_name("Dale Carnegie")
# Book creation
Book.create(
    title: "The Richest Man in Babylon",
    year: 1926,
    user: user1,
    author: @author1,
    genres: Genre.create_from_name("Financial")
)
Book.create(
    title: "The Tipping Point ",
    year: 2000,
    user: user2,
    author: @author2,
    genres: Genre.create_from_name("Psychology, Sociology")
)
Book.create(
    title: "Blink",
    year: 2005,
    user: user1,
    author: @author2,
    genres: Genre.create_from_name("Psychology, Sociology")
)
Book.create(
    title: "Outliers",
    year: 2008,
    user: user2,
    author: @author2,
    genres: Genre.create_from_name("Psychology, Sociology")
)
Book.create(
    title: "Public Speaking and Influencing Men in Business",
    year: 1926,
    user: user1,
    author: @author3,
    genres: Genre.create_from_name("Nonfiction, Biographies, Memoirs, Business, Investing")
)
Book.create(
    title: "How to Win Friends and Influence People",
    year: 1936,
    user: user2,
    author: @author3,
    genres: Genre.create_from_name("Nonfiction, Biographies, Memoirs, Business, Investing")
)
Book.create(
    title: "How to Stop Worrying and Start Living",
    year: 1948,
    user: user1,
    author: @author3,
    genres: Genre.create_from_name("Nonfiction, Biographies, Memoirs, Business, Investing")
)