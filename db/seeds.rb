quipu_attrs = {
  name:      "Quipu",
  subdomain: "quipu"
}

quipu = Team.find_or_create_by quipu_attrs

user_attrs = {
  email:    "example@example.com",
  team:     quipu
}

User.find_or_create_by(user_attrs) do |user|
  user.password = "secret123"
end
