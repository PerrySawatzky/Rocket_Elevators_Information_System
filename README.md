# README

Description

The purpose of this project is to create a database with real and fictional data.

Dependencies

Software needed:
- Ruby 2.6.6 - Open-source programming language
- Gem 3.0.9 -  Web framework
- Rails 5.2.6 - Open source database
- MySQL - Open-source relational database management system
- Dbeaver or MySQLWorkbench - Database administration tool

To try the program, you can create an account on the Rocket Elevators website and log in to the administration section. However, you do not need an account to submit a “Contact Us” or quote form.

Usage

We previously created a static website with a residential, commercial, and quote page. We will now be using a server to run the website. 

Here are the commands that will have to be entered in your terminal to start the server:
mySQL server start
rails db:create
rails s

Here are the commands that will have to be entered in your terminal when modifications are made in the database:
- Ctrl + C (to stop the server)
- rails db:migrate reset
- rails db:seed

Users/employees will now have the option to create an account by clicking on “Sign Up” in the navigation bar.

By clicking on “Login”, users will be redirected to a page and be asked to provide an email address and password.
	
	Example: 

	Email: nicolas.genest@codeboxx.biz
	Password: C************!

Forms are accessible to all users (with or without accounts). Once a “Contact Us” or quote form is filled and submitted, data is generated in the back-end.

To access the database, use Dbeaver or MySQLWorkbench, which shows a history of data stored in the server. The fictitious and real data covers the last 3 years of activity from companies. Graphical representations and charts will also be available in the administration part of the website. More details on how the data is stored in tables will be provided in the presentation video.