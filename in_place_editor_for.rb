gem 'actionpack'
require 'action_controller'

##
# &copy; 2006 Andrew Coleman
# Released under MIT license.
# http://www.opensource.org/licenses/mit-license.php
#
module Consolo
  module InPlaceEditorFor
    def in_place_edit_for(object, method)
      define_method "set_#{object}_#{method}" do
        obj = instance_variable_get("@#{object}")
        obj ||= object.to_s.camelize.constantize.find_by_id params[:id]
        if obj
          obj.send("#{method}=", params[:value])
          obj.save
          render :text => obj.send(method)
        else
          render :nothing => true
        end
      end
    end
  end
end

ActionController::Base.send :extend, Consolo::InPlaceEditorFor
