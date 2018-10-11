class PagesController < ApplicationController
  
  def home
    redirect_to teams_path if logged_in?
  end

end