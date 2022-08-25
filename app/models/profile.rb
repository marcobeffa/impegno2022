class Profile < ApplicationRecord
  belongs_to :user

  has_many :notes

  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/,
    message: "only allows letters" }
end
