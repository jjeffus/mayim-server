class ApplicationController < ActionController::Base

   def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def sign_in(*args)
    super(*args)
    current_user.update_attribute('online', true)
  end

  def sign_out(*args)
    super(*args)
    current_user.update_attribute('online', false)
  end
end
