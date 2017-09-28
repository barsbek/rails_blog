class User < ApplicationRecord
  has_attached_file :avatar,
    styles: {medium: "300x300>", small: "100x100>"}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :avatar
  validates_presence_of :login, :name, :email
  validates :email, email: true, uniqueness: true
  validates :login, length: {minimum: 2}
  validates :password, presence: true, length: {minimum: 6}, confirmation: true,
    on: :create
  validates :password, presence: true, length: {minimum: 6}, confirmation: true,
    allow_blank: true, on: :update
end
