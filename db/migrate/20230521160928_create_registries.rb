class CreateRegistries < ActiveRecord::Migration[6.0]
  def change
    create_table :registries do |t|
      t.string :name
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
