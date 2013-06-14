# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.destroy_all
t1 = Team.create!(name: 'Brasil', logotipo: 'brasil.png', abbrev: 'BRA')
t2 = Team.create!(name: 'Japão', logotipo: 'japao.png', abbrev: 'JAP')
t3 = Team.create!(name: 'México', logotipo: 'mexico.png', abbrev: 'MEX')
t4 = Team.create!(name: 'Itália', logotipo: 'italia.png', abbrev: 'ITA')
t5 = Team.create!(name: 'Espanha', logotipo: 'espanha.png', abbrev: 'ESP')
t6 = Team.create!(name: 'Uruguai', logotipo: 'uruguai.png', abbrev: 'URU')
t7 = Team.create!(name: 'Taiti', logotipo: 'taiti.png', abbrev: 'TAI')
t8 = Team.create!(name: 'Nigéria', logotipo: 'nigeria.png', abbrev: 'NIG')

Game.destroy_all
g1 = Game.create!(local: 'Mané Garrincha', gamedate: '2013-06-15', gametime: '16:00:00', computed: false, finished: false, closed: false)
g2 = Game.create!(local: 'Maracanã', gamedate: '2013-06-16', gametime: '16:00:00', computed: false, finished: false, closed: false)
g3 = Game.create!(local: 'Arena Pernambuco', gamedate: '2013-06-16', gametime: '19:00:00', computed: false, finished: false, closed: false)
g4 = Game.create!(local: 'Mineirão', gamedate: '2013-06-17', gametime: '16:00:00', computed: false, finished: false, closed: false)
g5 = Game.create!(local: 'Castelão', gamedate: '2013-06-19', gametime: '16:00:00', computed: false, finished: false, closed: false)
g6 = Game.create!(local: 'Arena Pernambuco', gamedate: '2013-06-19', gametime: '19:00:00', computed: false, finished: false, closed: false)
g7 = Game.create!(local: 'Maracanã', gamedate: '2013-06-20', gametime: '16:00:00', computed: false, finished: false, closed: false)
g8 = Game.create!(local: 'Fonte Nova', gamedate: '2013-06-20', gametime: '19:00:00', computed: false, finished: false, closed: false)
g9 = Game.create!(local: 'Mineirão', gamedate: '2013-06-22', gametime: '16:00:00', computed: false, finished: false, closed: false)
g10 = Game.create!(local: 'Fonte Nova', gamedate: '2013-06-22', gametime: '16:00:00', computed: false, finished: false, closed: false)
g11 = Game.create!(local: 'Castelão', gamedate: '2013-06-23', gametime: '16:00:00', computed: false, finished: false, closed: false)
g12 = Game.create!(local: 'Arena Pernambuco', gamedate: '2013-06-23', gametime: '16:00:00', computed: false, finished: false, closed: false)

MatchResult.destroy_all
MatchResult.create!(team_id: t1.id, game_id: g1.id, goals: 0)
MatchResult.create!(team_id: t2.id, game_id: g1.id, goals: 0)
MatchResult.create!(team_id: t3.id, game_id: g2.id, goals: 0)
MatchResult.create!(team_id: t4.id, game_id: g2.id, goals: 0)
MatchResult.create!(team_id: t5.id, game_id: g3.id, goals: 0)
MatchResult.create!(team_id: t6.id, game_id: g3.id, goals: 0)
MatchResult.create!(team_id: t7.id, game_id: g4.id, goals: 0)
MatchResult.create!(team_id: t8.id, game_id: g4.id, goals: 0)
MatchResult.create!(team_id: t1.id, game_id: g5.id, goals: 0)
MatchResult.create!(team_id: t3.id, game_id: g5.id, goals: 0)
MatchResult.create!(team_id: t2.id, game_id: g6.id, goals: 0)
MatchResult.create!(team_id: t4.id, game_id: g6.id, goals: 0)
MatchResult.create!(team_id: t5.id, game_id: g7.id, goals: 0)
MatchResult.create!(team_id: t7.id, game_id: g7.id, goals: 0)
MatchResult.create!(team_id: t6.id, game_id: g8.id, goals: 0)
MatchResult.create!(team_id: t8.id, game_id: g8.id, goals: 0)
MatchResult.create!(team_id: t2.id, game_id: g9.id, goals: 0)
MatchResult.create!(team_id: t3.id, game_id: g9.id, goals: 0)
MatchResult.create!(team_id: t1.id, game_id: g10.id, goals: 0)
MatchResult.create!(team_id: t4.id, game_id: g10.id, goals: 0)
MatchResult.create!(team_id: t5.id, game_id: g11.id, goals: 0)
MatchResult.create!(team_id: t8.id, game_id: g11.id, goals: 0)
MatchResult.create!(team_id: t6.id, game_id: g12.id, goals: 0)
MatchResult.create!(team_id: t7.id, game_id: g12.id, goals: 0)

User.destroy_all
user = User.create!(name: 'Admin', lastname: 'Bolão', password: 'admin12345', password_confirmation: 'admin12345', email: 'gilliard@quadrit.com.br', email_confirmation: 'gilliard@quadrit.com.br', typeof: User::USER_TYPE[:ADMIN][:id], score: 0)