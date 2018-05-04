class Feedback < ApplicationRecord
    belongs_to :user

    validates :rating, numericality: { less_than_or_equal_to: 5,  only_integer: true }

    validates :comment, length: {in: 0..280}

    # def feedback_user_id
    #   set_transaction
    #   if current_user.id == @lender.id
    #     @feedback_id = @borrower.id
    #   elsif current_user.id == @borrower.id
    #     @feedback_id = @lender.id
    #   end
    # end
end
