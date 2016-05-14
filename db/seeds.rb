quipu_attrs = {
  name:      "Quipu",
  subdomain: "quipu"
}

quipu = Team.find_or_create_by quipu_attrs

users_attrs = [{
  username: "Example",
  email:    "example@example.com",
  team:     quipu
}, {
  username: "Rokia",
  email: "ro@ki.a",
  team: quipu
}, {
  username: "Zacarías",
  email:    "za@ca.net",
  team:     quipu
}]

users_attrs.each do |user_attrs|
  User.find_or_create_by(user_attrs) do |user|
    user.password = "secret123"
  end
end
