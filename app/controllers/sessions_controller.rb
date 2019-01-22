class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    session[:username] = GithubRepo.new(params).login(session, params[:code])
    redirect_to '/'
  end
end
