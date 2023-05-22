class CreateCoordinators < ActiveRecord::Migration[6.0]
  def change
    create_table :coordinators do |t|
      t.string :email, unique: true, null: false
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
