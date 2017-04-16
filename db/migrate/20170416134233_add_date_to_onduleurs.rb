class AddDateToOnduleurs < ActiveRecord::Migration[5.0]
  def change
    add_reference :onduleurs, :date, foreign_key: true
  end
end
