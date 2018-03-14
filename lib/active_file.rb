# coding: utf-8
'require "fileutils"'

module ActiveFile

	def included(base)
		base.extend ClassMethods
		base.class_eval do
		attr_reader :id, :destroyed, :new_record
		
			def initialize
				@id = self.class.next_id
				@destroyed = false
				@new_record = true
			end
	end

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

		def field(name)  #next_id
			@fields ||= []
			@fields << name
		
			get = %Q{ 
				def #{name}
					@#{name}
				end 
			}

			set = %Q{
				def #{name}=(valor)
					@#{name}=valor	
				end	
			}

			self.class_eval get
			self.class_eval set	
		end
	end
	
	def self.included(base)
		base.extend ClassMethods
	end
	
end
	



