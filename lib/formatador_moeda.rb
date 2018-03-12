module FormatadorMoeda
	def valor_formatado
		"R$ #{@valor}"
	end

	def valor_formatado_desconto
		"R$ #{valor_com_desconto}"
	end	
end
