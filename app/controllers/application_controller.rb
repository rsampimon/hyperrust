class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_nav
  
  def get_nav
    @all_pages = Page.base
  end
end
