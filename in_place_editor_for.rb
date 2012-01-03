gem 'actionpack', '~> 2.3'
require 'action_controller'

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
