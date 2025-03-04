module SessionConcern
  extend ActiveSupport::Concern

  included do
    before_action :resume_session
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

  def authenticated?
    resume_session
  end

  def resume_session
    Current.session ||= find_session_by_route || start_new_session
    cookies.signed[:session_uuid] = Current.session.uuid
  end

  def find_session_by_route
    Session.find_by(uuid: params[:session_uuid] || cookies.signed[:session_uuid])
  end

  def start_new_session
    Session.create

  rescue ActiveRecord::RecordNotUnique
    retry
  end
end
