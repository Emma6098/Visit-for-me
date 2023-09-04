# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Critere.destroy_all
Booking.destroy_all
VisitForm.destroy_all
User.destroy_all
Chatroom.destroy_all

users = User.create([
{first_name: "Emma", last_name: "Creteur", email: "emma@toto.com", password: 123456},
{first_name: "Clara", last_name: "Herkert", email: "clara@toto.com", password: 123456},
{first_name: "Thomas", last_name: "Cambriels", email: "thomas@toto.com", password: 123456}
])


visit_forms = VisitForm.create!([
  {user_id: User.first.id, title: "Visit1", address: "21 Rue Haxo, Marseille", url: "url", rooms_number: 1},
  {user_id: User.second.id, title: "Visit2", address: "22 Rue Haxo, Marseille", url: "url", rooms_number: 2},
  {user_id: User.third.id, title: "Visit3", address: "23 Rue Haxo, Marseille", url: "url", rooms_number: 3}
])

criteres = Critere.create!([
  {visit_form_id: VisitForm.first.id, question:"blabla1"},
  {visit_form_id: VisitForm.second.id, question:"blabla2"},
  {visit_form_id: VisitForm.third.id, question:"blabla3"}
])

chatroom = Chatroom.create!({name:" la chatroom de la seed"})
