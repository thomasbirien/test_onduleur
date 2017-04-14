class OnduleurController < ApplicationController
  def index
    @onduleur = Onduleur.all
  end

  def import
    Onduleur.import(params[:file])
    redirect_to root_url, notice: "File imported"
  end
end
