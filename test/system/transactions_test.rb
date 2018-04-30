require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @transaction = transactions(:one)
  end

  test "visiting the index" do
    visit transactions_url
    assert_selector "h1", text: "Transactions"
  end

  test "creating a Transaction" do
    visit transactions_url
    click_on "New Transaction"

    fill_in "Body", with: @transaction.body
    fill_in "Borrower", with: @transaction.borrower_id
    fill_in "Category", with: @transaction.category
    fill_in "Day Rate", with: @transaction.day_rate
    fill_in "Expires At", with: @transaction.expires_at
    fill_in "Has Borrower Feedback", with: @transaction.has_borrower_feedback
    fill_in "Has Lender Feedback", with: @transaction.has_lender_feedback
    fill_in "Item Location", with: @transaction.item_location
    fill_in "Lender", with: @transaction.lender_id
    fill_in "Loan Duration", with: @transaction.loan_duration
    fill_in "Starts At", with: @transaction.starts_at
    fill_in "Status", with: @transaction.status
    fill_in "Title", with: @transaction.title
    fill_in "Type", with: @transaction.type
    click_on "Create Transaction"

    assert_text "Transaction was successfully created"
    click_on "Back"
  end

  test "updating a Transaction" do
    visit transactions_url
    click_on "Edit", match: :first

    fill_in "Body", with: @transaction.body
    fill_in "Borrower", with: @transaction.borrower_id
    fill_in "Category", with: @transaction.category
    fill_in "Day Rate", with: @transaction.day_rate
    fill_in "Expires At", with: @transaction.expires_at
    fill_in "Has Borrower Feedback", with: @transaction.has_borrower_feedback
    fill_in "Has Lender Feedback", with: @transaction.has_lender_feedback
    fill_in "Item Location", with: @transaction.item_location
    fill_in "Lender", with: @transaction.lender_id
    fill_in "Loan Duration", with: @transaction.loan_duration
    fill_in "Starts At", with: @transaction.starts_at
    fill_in "Status", with: @transaction.status
    fill_in "Title", with: @transaction.title
    fill_in "Type", with: @transaction.type
    click_on "Update Transaction"

    assert_text "Transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction" do
    visit transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction was successfully destroyed"
  end
end
