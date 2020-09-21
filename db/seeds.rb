# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

WeddingTheme.destroy_all

sunset = WeddingTheme.create(main_color: 'DDDDDD', dark_shadow: 'DDDDDD', dark_accent: 'DDDDDD', highlight: 'DDDDDD', light_accent: 'DDDDDD', font_family: 'Serif', theme_name: 'sunset')
classic = WeddingTheme.create(main_color: '777777', dark_shadow: '777777', dark_accent: '777777', highlight: '777777', light_accent: '777777', font_family: 'Serif', theme_name: 'classic')
elegant = WeddingTheme.create(main_color: '111111', dark_shadow: '111111', dark_accent: '111111', highlight: '111111', light_accent: '111111', font_family: 'Serif', theme_name: 'elegant')

