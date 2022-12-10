class Category < ApplicationRecord
  belongs_to :profile
  belongs_to :calendar
end
