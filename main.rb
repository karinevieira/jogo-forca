def verificar_se_acertou(palavra, chute, acertos, erros)
	for letra in 0..palavra.size
		if (palavra[letra] == chute)
			acertos << palavra[letra]
			puts "Acertos até agora #{acertos}"
			break
		end
	end
	erros << chute
end

def iniciar_jogo
	da_boas_vindas
	palavra = escolher_palavra
	acertos = []
	erros = []
	tentativas = 5
	
	for tentativa in 1..tentativas
		puts "Tentativa #{tentativa}"
		chute = pedir_chute acertos, erros
		verificar_se_acertou palavra, chute, acertos, erros
	end
end

def nao_quer_jogar?
	puts "Deseja jogar novamente? (S/N)"
	quer_jogar = gets.strip
	quer_jogar.upcase == "N"
end

loop do 
	iniciar_jogo
	if nao_quer_jogar?
		puts "Jogo finalizado"
		break
	end
end