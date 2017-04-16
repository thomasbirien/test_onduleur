class CreateDates < ActiveRecord::Migration[5.0]
  def change
    create_table :dates do |t|
      t.integer :total
      t.string :date

      t.timestamps
    end
  end
end
