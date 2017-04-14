class Onduleur < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Onduleur.create! row.to_hash
    end
  end
end
