class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def set_locate
  end
end
