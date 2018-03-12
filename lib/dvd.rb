# coding: utf-8
class DVD < Midia

	include FormatadorMoeda

	attr_reader :titulo

	def self.formata_moeda(*variaveis_e_metodos)
		variaveis_e_metodos.each do |name|
			define_method("#{name}_formatado") do
				valor = respond_to?(name) ? send(name) : instance_variable_get("@#{name}")
				"R$ #{valor}"
			end
		end
	end	


	formata_moeda :valor_com_desconto, :valor


	def initialize(titulo, valor, categoria)
		super()
		@titulo = titulo	
		@valor = valor
		@categoria = categoria
	end

	def to_s
		%Q{ Título: #{@titulo}, Valor: #{@valor} }
	end
end
