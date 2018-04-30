require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { body: @transaction.body, borrower_id: @transaction.borrower_id, category: @transaction.category, day_rate: @transaction.day_rate, expires_at: @transaction.expires_at, has_borrower_feedback: @transaction.has_borrower_feedback, has_lender_feedback: @transaction.has_lender_feedback, item_location: @transaction.item_location, lender_id: @transaction.lender_id, loan_duration: @transaction.loan_duration, starts_at: @transaction.starts_at, status: @transaction.status, title: @transaction.title, type: @transaction.type } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { body: @transaction.body, borrower_id: @transaction.borrower_id, category: @transaction.category, day_rate: @transaction.day_rate, expires_at: @transaction.expires_at, has_borrower_feedback: @transaction.has_borrower_feedback, has_lender_feedback: @transaction.has_lender_feedback, item_location: @transaction.item_location, lender_id: @transaction.lender_id, loan_duration: @transaction.loan_duration, starts_at: @transaction.starts_at, status: @transaction.status, title: @transaction.title, type: @transaction.type } }
    assert_redirected_to transaction_url(@transaction)
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
