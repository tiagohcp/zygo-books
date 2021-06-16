class ApplicationController < ActionController::Base
  require "browser/aliases"

  before_action :set_device_type

  Browser::Base.include(Browser::Aliases)

  def set_device_type
    request.variant = :phone if browser.mobile?
  end
end
