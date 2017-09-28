class User < ApplicationRecord
  validates :email, email: true
  validates :login, length: {minimum: 2}
  validates :password, length: {minimum: 6}, confirmation: true,
    on: :create
  validates :password, length: {minimum: 6}, confirmation: true,
    allow_blank: true, on: :update

  unless Rails.env == 'test'
    has_attached_file :avatar,
      styles: {medium: "300x300>", small: "100x100>"}
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    validates_presence_of :login, :name, :email
    validates_uniqueness_of :email, :login
  end
end
