# coding: utf-8
class Livro < Midia
	include FormatadorMoeda

	#attr_reader :categoria, :autor

	def initialize(titulo, autor, isbn = "1", numero_de_paginas, valor,  categoria)
		@titulo = titulo
		@autor = autor
		@isbn = isbn
		@numero_de_paginas = numero_de_paginas
		@valor = valor
		@categoria = categoria
		@desconto = 0.15
	end

	def to_s
		"Autor: #{@autor}, Isbn: #{@isbn}, Páginas: #{@numero_de_paginas}, Categoria: #{@categoria}"
	end
	
	def eql?(outro_livro)
		@isbn == outro_livro.isbn
	end

	def hash
		@isbn.hash
	end
	
end
