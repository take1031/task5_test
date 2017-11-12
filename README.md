# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :string
  end
end


20171104125000_add_column_to_users.rb