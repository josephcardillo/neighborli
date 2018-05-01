class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :transactions
  has_many :feedback
  has_many :borrowers, through: :transactions, source: :user
  has_many :lenders, through: :transactions, source: :user
  mount_uploader :avatar, AvatarUploader
end
