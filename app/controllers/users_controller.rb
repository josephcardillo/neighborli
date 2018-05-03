class UsersController < ApplicationController
    def index
    @users = User.all
    end

    def show
    @transaction = Transaction.new
    @user = User.find(params[:id])
    @lends = Transaction.where("lender_id = #{@user.id}")
    @borrows = Transaction.where("borrower_id = #{@user.id}")
    end
end
