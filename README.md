# **Yopeso Bookshelf Project**

A Ruby based app that helps you organize your Library

## To do
1. Rspec for views, models, controllers, routes

## Instructions

### Clone repository 

```git
clone https://github.com/ACirnici/bookshelf.git
```

```cd bookshelf```

### Change database.yml

locate and change with your editor of choice /config/database.yml

The field that you have to change are: 

```adapter: postgresql```        #choose your database adapter

```username: USER_NAME```        #place your database username

```# password: YOUR_PASSWORD``   #uncomment and place password for secured databases

#####Note: the default database for this app is postgresql

### DataBase initialization

For initialization of your database you have to run:

```rake db:create```

### Database Migration

Run the migrations:
```
rake db:migrate
```

### Seed in your database(optional)

To flood your DB with test objects run: 

```
rake db:seed
```

####Note: this command will create two users: 

test_admin@yopeso.com and test_user@yopeso.com both with password testbookshelf

Use them to test out the User rights system.

### Features

The Bookshelf app is dedicated to store book collections and authors.

On the `/book` page you can see All listed books. You can add new books by clicking "Add book" button or by link (/book/new).

Authors and Genres are created through book creation. Multiply genres should be separated by a comma.

After creating the book you are redirected to the book "Show" page, Where you can overview and set rate the created book.

After creating your book, you obtain the ability to edit your book by pressing the edit button or by link ``/edit``
 
You can access all Authors and Genres lists through buttons in the top menu, or by links: ``/authors`` and ``/genres``.

By accessing ``/authors`` or ``/genres`` lists you will see a list of authors or genres and their book representation.

You can access any Author or Genre and get a list of books that were written in this genre or by this author.

Also the book stores the user that added it to the library. You can also access the user list and their publications by the button in the top menu or by link ``/users``

Use "Sign up" button or the ``/users/sign_up`` link to register a user and the "Sign in" or ``/users/sign_in`` link to login

The ``Search`` field is able to search through authors, titles and book descriptions

### What is implemented:

1. Implemented authentication using Devise (https://github.com/plataformatec/devise).

2. Implemented the authorization functionality (added roles and permissions) using CanCan (https://github.com/ryanb/cancan)

3. Implemented a simple search functionality (using SQL ILIKE).

4. Implemented file upload functionality, add the possibility to upload book cover image using carrierwave (https://github.com/carrierwaveuploader/carrierwave)

5. Implemented the rating system. That means the possibility to rate a publication, view the publication ratings using ratyrate (https://github.com/wazery/ratyrate)


