class List < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :goals, dependent: :destroy
    validates :name, presence: true
end
