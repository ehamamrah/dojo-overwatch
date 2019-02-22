module Api
  class SharedController < ApplicationController
    def index
      records = resource_model.all
      render json: {  name: 'List', data: records,
                      message: message_to_show(records) }
    end

    def show
      render json: {  data: resource,
                      message: message_to_show(resource) }
    end

    private

    def message_to_show(targeted_object)
      targeted_object.present? ? 'Success' : 'No Details to Show'
    end

    def resource_name
      self.class.name.gsub('Controller', '').gsub('Api::', '').underscore.singularize
    end

    def resource
      instance_variable_get("@#{resource_name}")
    end

    def resource_model
      resource_name.classify.constantize
    end
  end
end
