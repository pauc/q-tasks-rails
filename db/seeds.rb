## QUIPU

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

## UOC

uoc_attrs = {
  name:      "UOC",
  subdomain: "uoc"
}

uoc = Team.find_or_create_by uoc_attrs

users_attrs = [{
  username: "Ferran P.",
  email:    "fpradosc@uoc.edu",
  team:     uoc
}, {
  username: "Antonio R.",
  email:    "aromanos@uoc.edu",
  team:     uoc
}, {
  username: "Pau C.",
  email:    "paucompte@uoc.edu",
  team:     uoc
}, {
  username: "Oriol",
  email:    "o@o.o",
  team:     uoc
}, {
  username: "Zacarías",
  email:    "z@z.z",
  team:     uoc
}, {
  username: "Atanasi D.",
  email:    "adaradoumis@uoc.edu",
  team:     uoc
}
]

users_attrs.each do |user_attrs|
  User.find_or_create_by(user_attrs) do |user|
    user.password = "secret123"
  end
end
