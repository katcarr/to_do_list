To Do List
==========
Creates a web app using Ruby to add a list and allow tasks to be added to a list
using a SQL database.

Database Setup
--------------

```sh
$ psql
$ CREATE DATABASE to_do;
$ \c to_do;
$ CREATE TABLE tasks (id serial PRIMARY KEY, description varchar, due_date date, list_id int);
$ CREATE TABLE lists (id serial PRIMARY KEY, name varchar);
```
App Setup
----------

Assuming you have ruby installed. In the terminal:
```sh
$ gem install bundler
$ bundle
$ ruby app.rb
```

Go to http://localhost:4567 in your browser

Tests
-----

In psql

```sh
$ CREATE DATABASE to_do_test WITH TEMPLATE to_do
```

Testing the ruby methods can be done via rspec.

```sh
$ gem install rspec
$ rspec
```
Motivation
---------

This app was created to practice interacting with SQL databases using PostgreSQL and the PG gem.

License
-------

MIT License, copyright 2015. Created by Kathryn Carr & Clem Freeman.
