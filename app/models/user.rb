class User < ApplicationRecord
  has_secure_password

  validates_presence_of :login, :name, :email
  validates_uniqueness_of :email, :login
  validates :email, email: true
  validates :login, length: {minimum: 2}
  validates :password, length: {minimum: 6}

  unless Rails.env == 'test'
    has_attached_file :avatar,
      styles: {medium: "300x300>", small: "100x100>"}
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  end
end
