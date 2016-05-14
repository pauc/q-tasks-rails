quipu_attrs = {
  name:      "Quipu",
  subdomain: "quipu"
}

quipu = Team.find_or_create_by quipu_attrs

users_attrs = [{
  username: "Hayk",
  email:    "h@h.com",
  team:     quipu
}, {
  username: "Albert",
  email: "a@a.com",
  team: quipu
}, {
  username: "Júlia",
  email: "j@j.com",
  team: quipu
}, {
  username: "Oriol",
  email: "o@o.com",
  team: quipu
}, {
  username: "Zacarías",
  email:    "z@z.com",
  team:     quipu
}]

users_attrs.each do |user_attrs|
  User.find_or_create_by(user_attrs) do |user|
    user.password = "secret123"
  end
end
