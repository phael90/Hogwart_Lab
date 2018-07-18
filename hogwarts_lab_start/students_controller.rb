require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students' do
  @students = Student.all()
  erb( :index )
end

# new
get '/students/new' do
  erb(:new)
end

#create
post '/students' do
 puts params
 @student_new = Student.new(params)
 @student_new.save
 erb( :create )
end

# show
get '/students/:id' do
  @student = Student.find(params['id'])
  erb( :show )
end

# edit
get '/students/:id/edit' do
  @houses = House.all()
  @student = Student.find(params['id'])
  erb( :edit)
end

# update
post '/students/:id' do
  student = Student.new( params )
  student.update()
  redirect to "students/" + params['id']
end

# destroy
post '/students/:id/delete' do
  student = Student.new(params)
  student.delete()
  redirect to '/students'
end
