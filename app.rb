require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/task')
require('./lib/list')
require('pg')

DB = PG.connect({:dbname => "to_do"})

get ("/") do
  erb(:index)
end

get("/lists/new") do
  erb(:list_form)
end

post("/lists") do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:success)
end

get("/lists") do
  @lists = List.all()
  erb(:lists)
end

get("/lists/:id") do
  @list = List.find(params[:id].to_i)
  erb(:list)
end

post("/tasks") do
  description = params[:description]
  list_id = params[:list_id].to_i
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id})
  @task.save
  erb(:tasks)
end
