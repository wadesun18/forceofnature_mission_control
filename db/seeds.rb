

Event.destroy_all
User.destroy_all
FilePath.destroy_all


10.times.each do
  User.create( email: Faker::Internet.free_email, password: Faker::Internet.password,first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.full_address)
end
@users = User.all

20.times.each do
  date = Faker::Date.forward(60)
  Event.create(title: Faker::Movie.quote,
              description:Faker::Lorem.paragraph(2),
              location: "#{Faker::Address.street_address}",
              start_time: date,
              end_time: ( date+ 2.hours),
              user: @users.sample

              )
end

files = []

30.times.each do
  files << Faker::File.file_name
end

10.times.each do
  files << (Faker::Company.industry.gsub(" ","_"))
end

files.shuffle!

files.each do |f|

    FilePath.create(
    path: f,
    is_folder:  f.include?('.') ? false : true
    )
end

@files = FilePath.all
my_files=[]
@files.each do |f|
  my_files << f

end



puts "#{Briefing.count} briefings added"
puts "#{FilePath.count} files and folders created"
puts "#{Event.count} events added"
