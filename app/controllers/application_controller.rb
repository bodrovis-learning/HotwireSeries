# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    #User.first
    User.find_by(id: cookies[:user_id]) || User.first
  end

  helper_method :current_user
end
