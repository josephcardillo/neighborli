class Transaction < ApplicationRecord
  belongs_to :borrower, optional: true, class_name:"User"
  belongs_to :lender, optional: true, class_name: "User"
  has_many :feedbacks
  mount_uploader :avatar, AvatarUploader

  validates :status, presence: true, length: {in: 4..9}
  validates :expires_at, presence: true
  validates :starts_at, presence: true
  validates :action, presence: true, length: {in: 4..6}
  validates :category, presence: true, length: {in: 3..12}
  validates :title, presence: true, length: {in: 3..140}
  validates :body, presence: true, length: {in: 5..280}
  validates :item_location, presence: true
  validates :loan_duration, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 30 }
  validates :day_rate, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }

end
