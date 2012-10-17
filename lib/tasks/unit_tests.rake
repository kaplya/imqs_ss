namespace :test do 
  namespace :units do
  	desc "For running units that tests validations"
  	task :validations do
  	  puts "Hello, Rake"

  	end	
  end
end

namespace :test do 
  namespace :units do
  	desc "For running frequently used units"
  	task :curr do
  	  puts "Hello, Rake"
  	  
  	end	
  end
end