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

## Description

This application was created to demonstrate my understanding of using Rails. It was designed for a fictional specialized food store that wishes to keep track of its products and customer feedback. Products and reviews can be added, removed, and edited by the user.

## User Stories

* _As an admin, I want to view, add, update and delete products._
* _As an admin, I want to view and delete reviews._
* _As an admin and customer, I want to click an individual product to see its detail page._
* _As a customer, I want to view, add, and update reviews to a product._

## Setup/Installation Requirements
* _You will need to install the following before proceeding (click on the link to follow the installation process):_
_[Ruby](https://www.ruby-lang.org/en/documentation/installation/),_
_[PostgreSQL](https://www.postgresql.org/docs/current/tutorial-install.html)_


* _Go to [GitHub](https://github.com/zperez0/volunteer_tracker)_
* _Clone git repository to local machine_
* _Navigate to root folder and open directory with VScode_
* _Install packages (type in the terminal):_
```
bundle install
```

#### Database setup:
* _create database (type in terminal):_
```
rake db:setup
```
* _seed database with faker gem(type in terminal):_
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

## Known Bugs
* _No known issues_

## License
[MIT](https://choosealicense.com/licenses/mit/)

Copyright (c) _2022_, _Z Perez_
