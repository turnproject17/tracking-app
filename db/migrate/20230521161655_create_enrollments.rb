class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :registry, null: false, foreign_key: true
      t.integer :method_of_contact, default: 0
      t.text :remarks
      t.references :coordinator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
