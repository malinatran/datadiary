# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FinanceEntry.delete_all
HealthEntry.delete_all
FitnessEntry.delete_all
MenstruationEntry.delete_all

finance_entries = FinanceEntry.create([
  { date: '(2015, October, 10)', expense: 50, category: 'Other', notes: 'Surprise gift for Mom during her visit to NYC', user_id: 5 },
  { date: '(2015, November, 1)', expense: 10, category: 'Dining & Drinking', notes: 'Best latte and croissant combination from Bien Cuit', user_id: 4 }
])

health_entries = HealthEntry.create([
  { date: '(2015, October, 13)', emotion: 'headache-y', notes: 'Two pills of Aspirin at 5pm', user_id: 5 },
  { date: '(2015, October, 26)', emotion: 'stressed', notes: 'Visit to Brooklyn Heights dermatologist; prescribed benzoyl peroxide', user_id: 4 }
])

fitness_entries = FitnessEntry.create([
  { date: '(2015, October, 15)', duration: 30, notes: 'Lap swimming: 20 min of front crawl, 10 min of butterfly stroke', user_id: 5 },
  { date: '(2015, November, 1)', duration: 45, notes: 'Prospect Park trail run with Ellen', user_id: 4 },
])

menstruation_entries = MenstruationEntry.create([
  { start_date: '(2015, September, 15)', end_date: '(2015, September, 20)', notes: 'Normal flow', user_id: 4 },
  { start_date: '(2015, October, 31)', end_date: '(2015, November, 3)', notes: 'Normal flow', user_id: 4 },
])

