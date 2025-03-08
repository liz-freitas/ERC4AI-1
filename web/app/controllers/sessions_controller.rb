class SessionsController < ApplicationController
  def index
    redirect_to new_session_path
  end

  def new
    @session = Current.session

    redirect_to session_requirements_path(@session)
  end

  def show
    @session = Current.session
    redirect_to session_requirements_path(@session)
  end
end
