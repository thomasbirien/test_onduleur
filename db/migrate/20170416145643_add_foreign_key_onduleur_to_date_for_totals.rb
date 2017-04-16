class AddForeignKeyOnduleurToDateForTotals < ActiveRecord::Migration[5.0]
  def change
    add_reference :date_for_totals, :onduleur, foreign_key: true

  end
end
