class CreateOnduleurs < ActiveRecord::Migration[5.0]
  def change
    create_table :onduleurs do |t|
      t.integer :identifier
      t.string :datetime
      t.integer :energy

      t.timestamps
    end
  end
end
