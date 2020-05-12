class UserSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers
  attributes :id, :name, :email, :bio, :avatar, :online, :last_login, :avatar_url

  def last_login
    distance_of_time_in_words(Time.now, object.updated_at)
  end

  def avatar_url
    return rails_blob_path(object.avatar, only_path: true)
    # variant = object.avatar.variant(resize: "100x100")
    # return rails_representation_url(variant, only_path: true)
  end
end
