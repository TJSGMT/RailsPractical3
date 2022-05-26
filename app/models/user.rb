class User < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
