# require gems
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db_2 = SQLite3::Database.new("information.db")
db.results_as_hash = true
db_2.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

get '/people/new' do
  erb :new_person
end

get '/people' do
  @people = db_2.execute("SELECT * FROM people")
  erb :display_people
end

post '/people' do
  db_2.execute("INSERT INTO people (name, age, gender) VALUES (?,?,?)", [params['name'], params['age'].to_i, params['gender']])
  redirect '/people'
end


# add static resources
