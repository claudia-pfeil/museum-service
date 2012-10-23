class CreateResources < ActiveRecord::Migration
  def up
    create_table(:resources) do |t|
      t.string  :name,      null: false
      t.string  :type
      t.integer :capacity,  null: false, default: 0
      t.text    :notes
      t.integer :user_id,   null: true

      t.timestamps
    end

    add_index :resources, :name
    add_index :resources, [:type, :name], unique: true
  end

  def down
    drop_table :resources
  end
end
