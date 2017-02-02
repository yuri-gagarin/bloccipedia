class Wiki < ApplicationRecord
  scope :public_wikis, -> { where(private: false) }


  belongs_to :user

  validates :title, presence: true, uniqueness: false, length: { minimum: 3, maximum: 35 }
  validates :body, presence: true, uniqueness: false, length: { minimum: 20 }
  validates :category, presence: true, uniqueness: false

end
