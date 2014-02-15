# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
	{email: 'rainaldo.crosbourne@time4lime.com', username: 'rainaldo.crosbourne'},
	{email: 'dwayne.williams@time4lime.com', username: 'dwayne.williams'},
	{email: 'bychan.brown@time4lime.com', username: 'bychan.brown'},
	{email: 'nari.ramdon@time4lime.com', username: 'nari.ramdon'}
	])