FactoryGirl.define do
  factory :team do
    sequence :subdomain do |n|
      "team_#{n}"
    end

    sequence :name do  |n|
      "Team #{n}"
    end
  end
end
