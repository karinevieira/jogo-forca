def da_boas_vindas
  puts "Bem-vindo ao Jogo da Forca"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "Vamos iniciar o jogo para você, #{nome}"
  puts "\n"
end

def pedir_chute(chutes, erros, tentativa, mascara)
  puts "Tentativa #{tentativa}"
  puts "Palavra: #{mascara}"
  puts "Chutes até agora: #{chutes}"
  puts "Agora insira uma letra ou uma palavra: "
  chute = gets.strip
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
  puts "Parabéns, você acertou!"
end

def aviso_palavra_nao_encontrada
  puts "Não foi dessa vez... tente novamente"
end

def aviso_pontuacao(pontos)
  puts "Você fez #{pontos} pontos."
end

def aviso_jogar_novamente
  puts "Deseja jogar novamente? (S/N)"
end

def aviso_jogo_finalizado
  puts "Jogo finalizado"
end