class CreatePrototypes < ActiveRecord::Migration[6.0]

  def change
    create_table :prototypes do |t|
      t.timestamps
      t.references :user, null:false
      t.string :title, null:false
      t.text :catch_copy, null:false
      t.text :concept, null:false
    end
  end
end
