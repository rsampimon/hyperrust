
#  == Usage




  @files = Dir.glob('*.html')
  @files.each do |file_name|
    puts file_name

   data = File.read(file_name)
   puts 'File ='+file_name
 
# (ClothRed) initialize(data) 
  
# text = ClothRed.new(data)
#  text.to_textile
 
 
 text = ClothRed.new(data) 
 text.to_textile  
 
   model_name = file_name.split(".")[0]
   puts 'Lets create a model named '+model_name
   
  
     
 #      puts data
 #      
  



	
	puts data
	
 # write file 

  new_file = File.new(file_name, 'w')
  new_file.write(text)

    
 end