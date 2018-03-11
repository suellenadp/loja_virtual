class Relatorio
	def initialize(biblioteca)
		@biblioteca = biblioteca
	end
	
	def total
		#@biblioteca.livros.inject(0) { |tot, livro| tot += livro.valor }
		#.map(&:valor.inject(0) {|tot, valor| tot += valor}
		@biblioteca.livros.map(&:valor).inject(:+)

	end
	def titulos
		titulos = []

		#@biblioteca.livros.map { |livro| livro.titulo }
		@biblioteca.livros.map &:titulo
	end
end

