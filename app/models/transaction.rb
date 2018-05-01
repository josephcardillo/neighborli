class Transaction < ApplicationRecord
    belongs_to :borrower, class_name:"User"
    belongs_to :lender, class_name: "User"
    mount_uploader :avatar, AvatarUploader
end
