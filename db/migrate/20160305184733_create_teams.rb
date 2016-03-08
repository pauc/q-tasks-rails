class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :subdomain, null: false
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :teams, :subdomain, unique: true

    add_reference :users, :team, foreign_key: { on_delete: :cascade }, null: false
    add_index :users, :team_id
    add_index :users, [:email, :team_id], unique: true
  end
end
