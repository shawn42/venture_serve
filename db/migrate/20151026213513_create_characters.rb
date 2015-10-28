class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :user_id, null: false

      t.string :name
      t.string :character_class

      t.integer :level, default: 1
      t.integer :current_health, default: 1
      t.integer :current_mana

      t.integer :strength, default: 0
      t.integer :intelligence, default: 0
      t.integer :wisdom, default: 0
      t.integer :dexterity, default: 0
      t.integer :constitution, default: 0
      t.integer :charisma, default: 0

      t.timestamps null: false
    end
  end
end
