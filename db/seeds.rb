# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
    ["joe@gmail.com", "Joe", "Cardillo", "123456"],
    ["noah@gmail.com", "Noah", "Callahan", "123456"],
    ["dave@gmail.com", "David", "Ester", "123456"]
  ]
  
  user_list.each do |email, fname, lname, password|
    User.create(email: email, fname: fname, lname: lname, password: password)
  end
  
  transaction_list = [
    [1, 2, "open",  DateTime.now, DateTime.now + 7.days, "borrow", "false", "false", "Lawn", "Lawnmower", "Lightly used - good condition", "Philadelphia", 7,  5],
    [2, 3, "closed",  DateTime.now, DateTime.now + 7.days, "borrow", "false", "false", "Kitchen", "Mixer", "Great for baking!", "Haddonfield", 3,  2],
    [3, 1, "closed",  DateTime.now, DateTime.now + 7.days, "lend", "true", "true", "Electronics", "DVD Player", "Great for watching movies", "Cherry Hill", 4,  3],
  ]
  
  transaction_list.each do |borrower_id, lender_id, status, starts_at, expires_at, action, has_borrower_feedback, has_lender_feedback, category, title, body, item_location, loan_duration, day_rate|
    Transaction.create(borrower_id: borrower_id, lender_id: lender_id, status: status, starts_at: starts_at, expires_at: expires_at, action: action, has_borrower_feedback: has_borrower_feedback, has_lender_feedback: has_lender_feedback, category: category, title: title, body: body, item_location: item_location, loan_duration: loan_duration, day_rate: day_rate)
  end
  
  feedback_list = [
    [1, 1,  1, "Awful experience"],
    [2, 3, 2,  "Okay experience"],
    [3, 5, 3,  "Great experience"]
  ]
  
  feedback_list.each do |user_id, rating, transaction_id, comment|
    Feedback.create(user_id: user_id, rating: rating, transaction_id: transaction_id, comment: comment)
  end