class OnduleursController < ApplicationController

  def index
    if params.has_key?("date")
      @onduleurs_choosen = Onduleur.where("datetime LIKE ?", "#{params[:date][:date]} %" )
      @total_for_a_date = @onduleurs_choosen.sum(:energy)
    elsif params.has_key?("date_time")
      @onduleurs_choosen_by_time = Onduleur.where("datetime LIKE ?", "#{params[:date_time][:date]} #{params[:date_time][:time]}" )
      @total_for_a_hour = @onduleurs_choosen_by_time.sum(:energy)
    else
      @onduleurs = Onduleur.all
    end
  end

  def import
    Onduleur.import(params[:file])
    redirect_to root_url, notice: "File imported"
  end
end
