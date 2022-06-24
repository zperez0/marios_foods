# Mario's Speciality Foods

#### By _**Z Perez**_

A web application providing CRUD functionality for the store's products.
Each product can also have reviews added to it.

## Technologies Used

* _HTML_
* _bootstrap scss_
* _Ruby_
* _Rails_
* _rspec_
* _pry_
* _Capybara_
* _PostgreSQL_
* _faker_
* _devise_
* _rails admin_

## Description

This application was created to demonstrate my understanding of using Rails, authorization and authentication with devise and setting up CRUD functionality. It was designed for a fictional specialized food store that wishes to keep track of its products and customer feedback. Products and reviews can be added, removed, and edited by an admin. A user must sign in in order to add a review.

## User Stories

* _As an admin, I want to view, add, update and delete products._
* _As an admin, I should be able to log in and log out of the application._
* _As an admin, I should be able to add, update and delete products._
*  _As an admin, I should be able to add reviews._
* _As a user, I want to be able to create an account and add a review to a product._

## Setup/Installation Requirements
* _You will need to install the following before proceeding (click on the link to follow the installation process):_
_[Ruby](https://www.ruby-lang.org/en/documentation/installation/),_
_[PostgreSQL](https://www.postgresql.org/docs/current/tutorial-install.html)_


* _Go to [GitHub](https://github.com/zperez0/volunteer_tracker)_
* _Clone git repository to local machine_
* _Navigate to root folder and open directory either with VScode or your terminal_
* _Install packages (type in the terminal):_
```
bundle install
```
* _Open up postgres (type in the terminal):_
```
postgres
```

#### Database setup:
* _Open up a new terminal tab_
* _create database (type in terminal):_
```
rake db:setup
```
* _To  create migration (type in terminal):_
* _for more inforamation on migrations check out [Rails Guides](https://guides.rubyonrails.org/active_record_migrations.html)_
```
rake db:migrate
```
```
rake db:test:prepare
```
* _seed database with faker gem (type in terminal):_
```
rake db:seed
```

#### Server:
* _Start server (type in terminal):_
```
rails s
```

* _Open up your browser and go to:_
```
http://localhost:3000/
```

#### Test:

* _Run test with rpsec (type in terminal):_
```
rspec
```

#### Users:

* _To create a new user visit the webpage, on the navbar click 'Sign up' and fill out the form_

###### _To update a user to admin status_
* _open rails console (type in terminal):_
```
rails c
```
* _To update an admin status in the terminal:_
```
User.where(email:"Insert your email here").update(admin: true)
```
* _Once an admin is created you can add users as admins. Go to the webpage, on the nav bar click on:_
```
"Admin"
```
* _This will take you to the Site Administration. click on:_
```
"Users"
```
* _Click on the pencil icon next to the user you want to edit._
* _Scroll down and hit the check box next to "Admin"._

###### Alternatively, if you seeded the database
* _you can sign in as the admin that is provided:_
```
email: "hotwaffle@gomail.com"
password: "password"
```

## Known Bugs
* _No known issues_

## License
[MIT](https://choosealicense.com/licenses/mit/)

Copyright (c) _2022_, _Z Perez_
