# frozen_string_literal: true

# :nodoc:
class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    set_transaction
    # @lender = @transaction.lender
    # @borrower = @transaction.borrower
    # @feedbacks = @transaction.feedbacks
    # @feedback_borrower = @feedbacks.listing.borrower
    # @feedback_lender = @feedbacks.listing.lender
    # puts '**************************'
    # puts @lender.id
    # puts @borrower.id
    # puts '**************************'
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit; end

  def borrow
    Transaction.update(params[:id], :borrower_id => current_user.id, :status => 'Closed')

  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.lender_id = current_user.id
    @transaction.action = 'Lend'
    @transaction.status = 'Open'

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # def set_user
    # set_transaction
    # if current_user == @lender.id
    #   user_id == @borrower.id
    # elsif current_user == @borrower.id
    #   user_id == @lender.id
    # end
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.require(:transaction).permit(:borrower_id, :lender_id, :status, :expires_at, :starts_at, :action, :has_borrower_feedback, :has_lender_feedback, :category, :title, :body, :item_location, :loan_duration, :day_rate, :avatar)
  end
end
