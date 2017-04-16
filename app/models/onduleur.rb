class Onduleur < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Onduleur.create! row.to_hash
    end
    onduleur_id = Onduleur.last.id
    date = Onduleur.last_date
    total = Onduleur.where("datetime LIKE ?", "#{date} %").sum(:energy)
    info = {date: date, total: total, onduleur_id: onduleur_id}
    DateForTotal.create(info)

  end

  def self.date_for_collection
    onduleurs = Onduleur.all
    date_time = onduleurs.map {|onduleur| onduleur[:datetime]}
    date_collection = []
    date_time.each do |dt|
      date = DateTime.strptime(dt, "%d/%m/%y %R")
      date.to_date
      date_collection << date.strftime("%d/%m/%y")
    end
    date_collection.uniq
  end

  def self.time_for_collection
    onduleurs = Onduleur.all
    date_time = onduleurs.map {|onduleur| onduleur[:datetime]}
    time_collection = []
    date_time.each do |dt|
      time = DateTime.strptime(dt, "%d/%m/%y %R")
      time.to_date
      time_collection << time.strftime("%R")
    end
    time_collection.uniq
  end

  private


  def self.last_date
    onduleur_last_date = Onduleur.last.datetime
    date = DateTime.strptime(onduleur_last_date, "%d/%m/%y %R")
    date.to_date
    last_date = date.strftime("%d/%m/%y")
  end
end
