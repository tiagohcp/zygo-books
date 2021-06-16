class ApplicationController < ActionController::Base
  require "browser/aliases"

  before_action :set_device_type

  Browser::Base.include(Browser::Aliases)

  def set_device_type
    Rails.logger.info('*********** ENTROU set_device_type *************')
    Rails.logger.info(browser)
    Rails.logger.info(browser.mobile?)
    request.variant = :phone if browser.mobile?
  end
end
