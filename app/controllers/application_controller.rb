class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 
   include Blacklight::Controller
  # Please be sure to impelement current_user and user_session. Blacklight depends on 
  # these methods in order to perform user specific actions. 
# completely Blacklight 3.x-backwards compatible
layout :choose_layout

# if you don't need dynamic layout switching, just do the Rails-standard:
layout 'blacklight'
  protect_from_forgery
end
