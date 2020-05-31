# config/initializers/pundit.rb
# Extends the ApplicationController to add Pundit for authorization.
# Modify this file to change the behavior of a 'not authorized' error.
# Be sure to restart your server when you modify this file.
module PunditHelper
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    mess = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    if request.format == 'application/json'
      render status: :forbidden, json: {error: "#{mess}" }
    elsif request.format == 'html'
      flash[:error] = "#{mess}"
      puts '------------pundit.rb user_not_authorized(exception)--------------------'
      puts request.referrer
      puts '------------------------------------------------------------------------'
      # redirect_to(:back) is being deprecated in Rails 5
      # redirect_to(request.referrer || root_path)
      redirect_back( fallback_location: request.referrer || root_path )
    else
      head :forbidden
    end
  end  

  def skip_authorization
    @_pundit_policy_authorized = true
  end
  
end

ApplicationController.send :include, PunditHelper
