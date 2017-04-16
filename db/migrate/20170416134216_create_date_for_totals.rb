class CreateDateForTotals < ActiveRecord::Migration[5.0]
  def change
    create_table :date_for_totals do |t|
      t.integer :total
      t.string :date

      t.timestamps
    end
  end
end
