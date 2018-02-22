class Company < ApplicationRecord

  has_many :jobs

  validates :name, presence: true, length: { maximum: 50 }
  validates :website, presence: true, format: { with: /(^|\s)((https?:\/\/)?[\w-]+(\.[\w-]+)+\.?(:\d+)?(\/\S*)?)/ }
  validates :headquarters, presence: true, length: { maximum: 50 }
  validates :size, presence: true, length: { maximum: 50 }
  validates :founded, presence: true, length: { maximum: 50 }, format: { with: /^\d{4}$/, multiline: true }
  validates :industry, presence: true, length: { maximum: 50 }
  validates :synopsis, presence: true
end
