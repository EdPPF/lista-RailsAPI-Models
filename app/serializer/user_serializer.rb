class UserSerializer < Panko::Serializer
  attributes :name, :email, :profile_picture_url, :authentication_token, :id

  def profile_picture_url
    Rails.application.routes.url_helpers.rails_blob_path(object.profile_picture, only_path: true) if object.profile_picture.attached?
  end
end
