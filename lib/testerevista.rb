class Revista
    attr_reader :titulo, :id
    
    def initialize(titulo, valor)
        @titulo = titulo
        @valor = valor
        @id = self.class.next_id # Atribui um id ao objeto Revista
    end

    def save
    	FileUtils.mkdir_p("/home/suellen_alinep/loja_virtual/db/revistas") unless File.exist?("/home/suellen_alinep/loja_virtual/db/revistas") 
        File.open(File.join("/home/suellen_alinep/loja_virtual/db/revistas", '#{@id}.yml'), 'wb') do |file|
            file.puts serialize
=begin       
 File.open(File.join(Dir.pwd, "/db/revistas/#{@id}.yml"), "w") do |file|
            file.puts serialize
=end
	end
   end

   private
   def serialize
       YAML.dump self
   end
  
   def self.next_id
	
   Dir.glob("./db/revistas/*.yml").size + 1
  end
end
