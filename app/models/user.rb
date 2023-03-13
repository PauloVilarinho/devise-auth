class User < ApplicationRecord
  has_many :posts

  validates :role, presence: true

  before_validation :set_default_role, on: :create

  devise :database_authenticatable, :registerable, :validatable

  def admin?
    role == 'admin'
  end

  def publisher?
    role == 'publisher'
  end

  private

  def set_default_role
    self.role = 'publisher' if self.role.blank?
  end
end
