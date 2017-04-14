class OnduleursController < ApplicationController
  def index
    @onduleurs = Onduleur.all
  end

  def import
    Onduleur.import(params[:file])
    redirect_to root_url, notice: "File imported"
  end
end
