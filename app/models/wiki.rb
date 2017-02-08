class Wiki < ApplicationRecord
  scope :public_wikis, -> { where(private: false) }


  has_many :collaborators

  has_many :users, through: :collaborators

  validates :title, presence: true, uniqueness: false, length: { minimum: 3, maximum: 35 }
  validates :body, presence: true, uniqueness: false, length: { minimum: 20 }
  validates :category, presence: true, uniqueness: false

end
