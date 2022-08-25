class Profile < ApplicationRecord
  belongs_to :user

  has_many :notes

  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-z0-9_]+\z/,
    message: "può contenere solo lettere minuscole e numeri e _" }
end
