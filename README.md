# **Yopeso Bookshelf Project**

A Ruby based app that helps you organize your Library

## Instructions

### Clone repository 

```git
clone https://github.com/ACirnici/bookshelf.git
```

```cd booshelf```

### Change database.yml

locate and change with your editor of choice /config/database.yml

The field that you have to change are: 

```adapter: postgresql```   #choose your database adapter

```username: USER_NAME```   #place your database username

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

test_admin@yopeso.com and test_user@yopeso.com both with passwd testbookshelf

Use them to test out the User rights system.

### What is impelented:

1. Implemented authentication using Devise (https://github.com/plataformatec/devise).

2. Implemented the authorization functionality (added roles and permissions) using CanCan (https://github.com/ryanb/cancan)

3. Implemented a simple search functionality (using SQL ILIKE).

4. Implemented file upload functionality, add the possibility to upload book cover image using carrierwave (https://github.com/carrierwaveuploader/carrierwave)

5. Implemented the rating system. That means the possibility to rate a publication, view the publication ratings using ratyrate (https://github.com/wazery/ratyrate)


