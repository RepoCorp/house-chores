# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    ['mama', 'delacuesta@hotmail.com'],
    ['Manue', 'manuela.dlc@hotmail.com'],
    ['Migue', 'miguelortizdelacuesta@gmail.com']

]

chores = [
    'Limpiar arena gatos',
    'Aplicar medicamento gatos',
    'Tender la cama',
    'Recoger ropa del baño'
]

scheduled_chores = [
    { chore: 0, days: [false, true, false, true, false, true, false], user: 1 },
    { chore: 0, days: [true, false, true, false, true, false, false], user: 2 },
    { chore: 1, days: [false, true, false, true, false, true, true], user: 1 },
    { chore: 1, days: [true, false, true, false, true, false, false], user: 2 },
    { chore: 2, days: [true, false, true, false, false, true, true], user: 0 },
    { chore: 2, days: [true, false, true, false, false, true, true], user: 2 },
    { chore: 3, days: [true, false, true, false, false, true, true], user: 2 }
]

users.each do |user|
  User.where(name: user[0]).first_or_create!(email: user[1], password: 'temppassword')
end

chores.each do |chore|
  Chore.where(name: chore).first_or_create
end

scheduled_chores.each do |scheduled_chore|
  user =  User.where(name: users[scheduled_chore[:user]][0]).first
  chore = Chore.where(name: chores[scheduled_chore[:chore]]).first
  new_scheduled_chore = ScheduledChore.where(chore: chore, user: user).first_or_create
  scheduled_chore[:days].each_with_index do |value, index|
    field = ScheduledChore::DOW_TO_FIELD[index]
    new_scheduled_chore[field] = value
  end
  new_scheduled_chore.active = true
  new_scheduled_chore.save!
end