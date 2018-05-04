class CategoryController < ApplicationController
  def index
  end

  def show
  @transactions = Transaction.where("category = ?", params[:category])
  end
end
