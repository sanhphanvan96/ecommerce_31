class User < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  before_save :downcase_email
  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :email, presence: true, length: {maximum: Settings.max_email},
    format: {with: Settings.VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :phone, length: {maximum: Settings.max_phone},
    format: {with: Settings.VALID_PHONE_REGEX}, allow_blank: true
  validates :address, length: {maximum: Settings.max_name}, allow_blank: true
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.min_password},
    allow_nil: true
  scope :order_by_created_at, ->{order created_at: :desc}

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
