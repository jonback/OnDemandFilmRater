require 'rubygems'
require 'active_record'

if ENV['DATABASE_URL']
  db = URI.parse(ENV['DATABASE_URL'])
  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
else
  ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => '.movies.db')
end

class Movie < ActiveRecord::Base; end

# define the movies table (if it doesn't already exist)
if !Movie.table_exists?
  ActiveRecord::Base.connection.create_table(:movies) do |t|
    t.column :name, :string
    t.column :rating, :integer
    t.column :critic, :integer
    t.column :year, :integer
    t.column :runtime, :integer
    t.column :rt_id, :integer    
    t.column :rt_url, :string
    t.column :poster_url, :string
    t.column :summary, :string
  end
end