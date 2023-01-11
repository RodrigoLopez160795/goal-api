class Goal < ApplicationRecord
  belongs_to :list
  validates :name, length: { minimum: 3, maximum: 20 }, presence: true
  validates :description, length: { maximum: 100 }
  validates :finish_at,
            format: { with: %r{\A^(0?[1-9]|[12][0-9]|3[01])[/\-](0?[1-9]|1[012])[/\-]\d{4}$\z},
                      message: 'invalid date: Format dd-mm/yyyy' }, allow_nil: true
end
