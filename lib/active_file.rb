# coding: utf-8
'require "fileutils"'

module ActiveFile

	def save	
		@new_record = false #seta objeto como resgistro existente	
		
		File.open("../db/revistas/#{@id}.yml", "w") do |file|
			file.puts serialize
		end
	end

	def destroy
		unless @destroyed or @new_record
			@destroyed = true
			FileUtils.rm "../db/revista/#{@id}.yml"
		end
	end

	module ClassMethods
		def find(id)
			raise DocumentNotFound, "Arquivos ../db/revistas/#{id} não encontrado.", caller
			unless File.exists?("../db/revistas/#{id}.yml")
				YAML.load File.open("../db/revistas/#{id}.yml", "r")
			end
		end

		def field(name)  #next_id
			@fields ||= []
			@fields << name
		
			get = %Q{ 
				def #{name}
					@#{name}
				end }

			set = %Q{
				def #{name}=(valor)
					@#{name}=valor	
				end	
					}
		end
	end
	
	def self.included(base)
		base.extend ClassMethods
	end

	private
	
	def serialize
		YAML.dump self
	end
end
	



