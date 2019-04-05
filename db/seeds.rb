# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

user = User.create(
  uuid: 'asdf'
)

first_poll = Poll.create!(
  name: 'FirstPoll',
  user: user,
)

prohibit_cats_run = Question.create!(
  title: 'Prohibit cats to run?',
  body: '',
  poll: first_poll,
)
prohibit_mice_holes = Question.create!(
  title: 'Prohibit mice to make holes?',
  body: '',
  poll: first_poll,
)

cat_party = PoliticalParty.create!(
  name: 'cat',
)
mice_party = PoliticalParty.create!(
  name: 'mice',
)

PoliticalPartyAnswer.create!(
  political_party: cat_party,
  question: prohibit_cats_run,
  vote: 'no',
)
PoliticalPartyAnswer.create!(
  political_party: cat_party,
  question: prohibit_mice_holes,
  vote: 'yes',
)
PoliticalPartyAnswer.create!(
  political_party: mice_party,
  question: prohibit_cats_run,
  vote: 'yes',
)
PoliticalPartyAnswer.create!(
  political_party: mice_party,
  question: prohibit_mice_holes,
  vote: 'no',
)
