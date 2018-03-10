Crear una aplicación con sinatra con una vista index.erb  en la ruta '/'





#Gemfile
source "http://rubygems.org"

gem "sinatra-activerecord"
gem "rake"
gem "sqlite3"


# app.rb
require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:myblogdb.sqlite3"


#Rakefile

require "./app"
require "sinatra/activerecord/rake"


 rake db:create

 rake db:create_migration NAME=create_posts


 class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
        t.string :title
        t.text :body
        t.timestamps null: false
    end
  end
end


rake db:migrate

#models.rb
class Post < ActiveRecord::Base
end


#app.rb
#place after require "sinatra/activerecord"
require "./models.rb"


Post.create(title: "Hello World!", body: "All work and no play makes Jack a dull boy")