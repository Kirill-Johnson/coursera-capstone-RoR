# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Service.destroy_all

Service.create(name: "Excursion", description: "Very interesting excursion...", p_note: "That's private note", creator_id: "2")

Service.create(name: "Sightseeing tour", description: "Very interesting tour...", p_note: "That's private note!", creator_id: "4")
