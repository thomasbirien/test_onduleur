class AddPhotoToOnduleurs < ActiveRecord::Migration[5.0]
  def change
    add_reference :onduleurs, :photo, foreign_key: true
  end
end
