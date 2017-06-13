class User < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  before_save :downcase_email
  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :email, presence: true, length: {maximum: Settings.max_email},
    format: {with: Settings.VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.min_password}
  validates :phone, length: {maximum: Settings.max_phone},
    format: {with: Settings.VALID_PHONE_REGEX}
  validates :address, length: {maximum: Settings.max_name}
  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
