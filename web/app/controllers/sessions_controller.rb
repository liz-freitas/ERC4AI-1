class SessionsController < ApplicationController
  def new
    @session = Current.session

    redirect_to new_session_requirement_path(@session)
  end
end
