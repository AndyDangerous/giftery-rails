# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_hashes = [
  {
    name: "Lothaire Fae",
    email: "lfae@test.com",
    password: "password",
    superadmin_role: true
  },
  {
    name: "Subhash Roz",
    email: "sroz@test.com",
    password: "password",
  },
  {
    name: "Wit Rivka",
    email: "wrivka@test.com",
    password: "password",
  },
]

item_hashes = [
  {
    name: "doll",
    description: "a nice doll",
    url: "http://www.amazon.com",
    available: true,
  },
  {
    name: "hammer",
    description: "a nice hammer",
    url: "http://www.amazon.com",
    available: true,
  },
  {
    name: "mocking bird",
    description: "a nice mocking bird",
    url: "http://www.amazon.com",
    available: false,
  },
  {
    name: "diamond ring",
    description: "a nice diamond ring",
    url: "http://www.amazon.com",
    available: true,
  },
  {
    name: "looking glass",
    description: "a nice looking glass",
    url: "http://www.amazon.com",
    available: true,
  },
  {
    name: "billy goat",
    description: "a nice billy goat",
    url: "http://www.amazon.com",
    available: false,
  },
  {
    name: "cart",
    description: "a nice cart",
    url: "http://www.amazon.com",
    available: true,
  },
  {
    name: "bull",
    description: "a nice bull",
    url: "http://www.amazon.com",
    available: false,
  },
  {
    name: "dog",
    description: "a nice dog",
    url: "http://www.amazon.com",
    available: false,
  },
  {
    name: "cart",
    description: "a nice cart",
    url: "http://www.amazon.com",
    available: true,
  },
]

group = Group.where(name: "Family").first_or_create

items = item_hashes.map do |hsh|
  Item.new(hsh)
end

def user_exists_with_email?(email)
  !User.where(email: email).empty?
end
user_hashes.each do |hsh|
  unless user_exists_with_email?(hsh[:email])
    user = User.create(hsh)
    user.confirm
    list = user.lists.new
    list.group = group
    list.items << items.pop(4)
    list.save
    user.save
  end
end
