class SessionsController < Devise::SessionsController
  include Response

  respond_to :json
  skip_before_action :verify_authenticity_token

  private

  def respond_with(resource, _opts = {})
    json_response(resource)
  end

  def respond_to_on_destroy
    head :no_content
  end
end
