# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @lends = Transaction.where('lender_id = ?', @user.id)
    @borrows = Transaction.where('borrower_id = ?', @user.id)
  end
end
