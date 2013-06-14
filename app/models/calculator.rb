# encoding: UTF-8
class Calculator < ActiveRecord::Base
  
	def self.getResult homeGoals, awayGoals
		
		if homeGoals > awayGoals
			result = 'v'
		elsif homeGoals < awayGoals
			result = 'd'
		else
			result = 'e'
		end

		return result
	end

	def self.getPoints resultOfMatch, resultOfUserHint, homeGoals, userHomeGoals, awayGoals, userAwayGoals

		correctResult = resultOfMatch.eql?(resultOfUserHint) ? true : false
		correctHomeGoals = homeGoals == userHomeGoals ? true : false
		correctAwayGoals = awayGoals == userAwayGoals ? true : false

		if correctHomeGoals && correctAwayGoals
			return 10
		end

		if correctResult

			if (correctHomeGoals || correctAwayGoals)
				return 7
			else 
				return 5
			end
		else

			if (correctHomeGoals || correctAwayGoals)
				return 2
			else
				return 0
			end

		end

	end

	def self.calculate games, users

		games.each do |game|
			Rails.logger.info("Game id: #{game.id}")

			homeTeamId = game.match_results.first.team_id
			homeGoals = game.match_results.first.goals
			awayTeamId = game.match_results.last.team_id
			awayGoals = game.match_results.last.goals
			Rails.logger.info('MATCH: Home x Away Goals')
			Rails.logger.info("#{homeGoals} x #{awayGoals}")

			#Obtem o resultado da partida em relação ao Home Team. 'v' -> vitória, 'd' -> derrota, 'e' -> empate
			resultOfMatch = getResult(homeGoals, awayGoals)
			Rails.logger.info("Resultado do Jogo: #{resultOfMatch}")

			User.transaction do
				begin
					users.each do |user|
						Rails.logger.info("Name: #{user.name}")
						gameHints = user.hints.where(:game_id => game.id)
						#Se esse id for igual ao do time que chamamos de Home e depois para o Away

						unless gameHints.empty?
							userHomeHint = gameHints.first.team_id == homeTeamId ? gameHints.first : gameHints.last
							userAwayHint = gameHints.first.team_id == awayTeamId ? gameHints.first : gameHints.last

							userHomeTeamId = userHomeHint.team_id
							userHomeGoals = userHomeHint.goals
							userAwayTeamId = userAwayHint.team_id
							userAwayGoals = userAwayHint.goals

							Rails.logger.info('USER: Home x Away Goals')
							Rails.logger.info("#{userHomeGoals} x #{userAwayGoals}")
							
							#Obtem o resultado que o user sugeriu
							resultOfUserHint = getResult(userHomeGoals, userAwayGoals)
							Rails.logger.info("Resultado do Palpite: #{resultOfUserHint}")
							pointsMarked = getPoints(resultOfMatch, resultOfUserHint, homeGoals, userHomeGoals, awayGoals, userAwayGoals)
							Rails.logger.info("Pontos Marcados: #{pointsMarked}")

					        userHomeHint.update_attributes(:points => pointsMarked)
					        userAwayHint.update_attributes(:points => pointsMarked)			   

					        if user.score.nil?
					        	user.score = 0
					        end
						    user.score += pointsMarked
						    
						    user.email_confirmation = user.email.downcase
						    user.update_attributes(:name => user.name, :lastname => user.lastname, :email => user.email.downcase, :score => user.score)
						end
					end
				rescue => e
					Rails.logger.info("***********************************ERRO***********************************************************")
			        logger.error e.message
			        print e.to_s + "\n" + e.backtrace.join("\n")
			    end
			end

			game.update_attributes(:computed => true)
		end
	end

end