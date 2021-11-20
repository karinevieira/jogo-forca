def da_boas_vindas
	puts "Bem-vindo ao Jogo da Forca"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "Vamos iniciar o jogo para você, #{nome}"
  puts "\n"
  nome
end

def desenha_forca(erros)
  cabeca = "   "
  corpo = " "
  pernas = "   "
  bracos = "   "
  if erros >= 1
    cabeca = "(_)"
  end
  if erros >= 2
    bracos = " | "
    corpo = "|"
  end
  if erros >= 3
    bracos = "\\|/"
  end
  if erros >= 4
    pernas = "/ \\"
  end

  puts "  _______       "
  puts " |/      |      "
  puts " |      #{cabeca}  "
  puts " |      #{bracos}  "
  puts " |       #{corpo}  "
  puts " |      #{pernas}  "
  puts " |              "
  puts "_|___           "
  puts

end

def pedir_chute(chutes, erros, tentativa, mascara)
  puts "Tentativa #{tentativa}"
  desenha_forca erros
  puts "Palavra: #{mascara}"
  puts "Chutes até agora: #{chutes}"
	puts "Agora insira uma letra ou uma palavra: "
  chute = gets.strip.downcase
	chute
end

def aviso_escolhendo_palavra
  puts "Escolhendo uma palavra..."
end

def aviso_palavra_escolhida(palavra)
  puts "A palavra escolhida tem #{palavra.size} letras, boa sorte!"
	puts "\n"
end

def aviso_chute_repetido(chute)
  puts "Você já chutou #{chute}"
end

def aviso_palavra_encontrada
  puts "\nParabéns, você ganhou!"
  puts

  puts "       ___________      "
  puts "      '._==_==_=_.'     "
  puts "      .-\\:      /-.    "
  puts "     | (|:.     |) |    "
  puts "      '-|:.     |-'     "
  puts "        \\::.    /      "
  puts "         '::. .'        "
  puts "           ) (          "
  puts "         _.' '._        "
  puts "        '-------'       "
  puts
end

def aviso_palavra_nao_encontrada
  puts "Não foi dessa vez... tente novamente"
end

def aviso_pontuacao(pontos)
  puts "Você fez #{pontos} pontos."
end

def aviso_pontos_totais(pontos_totais)
  puts "Você tem #{pontos_totais} pontos."
end

def aviso_campeao_atual(dados)
  puts "Campeão atual é #{dados[0]} com #{dados[1]} pontos"
end

def aviso_jogar_novamente
  puts "Deseja jogar novamente? (S/N)"
end

def aviso_jogo_finalizado
  puts "Jogo finalizado"
end