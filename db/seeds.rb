# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# users.destroy_all
# visit_forms.destroy_all
# cirteres.destroy_all

users = User.create([
{first_name: "Emma", last_name: "Creteur", email: "emma@gmail.com", password: 123456},
{first_name: "Clara", last_name: "Herkert", email: "clara@gmail.com", password: 123456},
{first_name: "Thomas", last_name: "Cambriels", email: "thomas@gmail.com", password: 123456}
])


visit_forms = VisitForm.create!([
  {user_id: User.first.id, title: "Visit1", address: "21 Rue Haxo", url: "url", rooms_number: 1},
  {user_id: User.second.id, title: "Visit2", address: "21 Rue Haxo", url: "url", rooms_number: 2},
  {user_id: User.third.id, title: "Visit3", address: "21 Rue Haxo", url: "url", rooms_number: 3}
])

criteres = Critere.create!([
  {visit_form_id: VisitForm.first.id, content:"blabla1"},
  {visit_form_id: VisitForm.second.id, content:"blabla2"},
  {visit_form_id: VisitForm.third.id, content:"blabla3"}
])
