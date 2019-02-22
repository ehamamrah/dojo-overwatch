module Api
  class SharedController < ApplicationController
    def show
      render json: {  data: resource,
                      message: message_to_show(resource) }
    end

    private

    def message_to_show(targeted_object)
      targeted_object.present? ? 'Success' : 'No Details to Show'
    end

    def resource
      name = self.class.name.gsub('Controller', '').gsub('Api::', '').underscore.singularize
      instance_variable_get("@#{name}")
    end
  end
end
