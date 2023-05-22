class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.date :dob, null: false

      t.timestamps
    end
  end
end
