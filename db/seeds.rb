# rubocop:disable LineLength
# frozen_string_literal: true

test_users = [
  ['joe@gmail.com', 'Joe', 'Cardillo', '123456'],
  ['noah@gmail.com', 'Noah', 'Callahan', '123456'],
  ['dave@gmail.com', 'David', 'Elster', '123456']
]
test_users.each do |em, fn, ln, pw|
  User.create(email: em, fname: fn, lname: ln, password: pw, password_confirmation: pw)
end

# Currently Missing Test Data for Location/Avatar
transaction_list = [
  [nil, 2, 'Open', DateTime.now, DateTime.now + 7.days, 'Borrow', true, false, 'Lawn', 'Lawnmower', 'Lightly used - good condition', 'Philadelphia', 7, 5],
  [nil, 3, 'Open', DateTime.now, DateTime.now + 3.days, 'Borrow', false, true, 'Kitchen', 'Mixer', 'Great for baking!', 'Haddonfield', 3, 2],
  [nil, 1, 'Open', DateTime.now, DateTime.now + 4.days, 'Lend', true, true, 'Electronics', 'DVD Player', 'Great for watching movies', 'Cherry Hill', 4, 3]
]
transaction_list.each do |bid, lid, stat, star, exp, act, hbf, hlf, cat, tit, bod, loc, dur, rate|
  Transaction.create(borrower_id: bid, lender_id: lid, status: stat, starts_at: star, expires_at: exp, action: act, has_borrower_feedback: hbf, has_lender_feedback: hlf, category: cat, title: tit, body: bod, item_location: loc, loan_duration: dur, day_rate: rate)
end

feedback_list = [
  [1, 1, 1, 'Awful experience -Borrower'],
  [3, 3, 2, 'Okay experience -Lender'],
  [3, 5, 3, 'Great experience -Borrower'],
  [1, 5, 3, 'Great experience -Lender']
]
feedback_list.each do |uid, rat, tid, com|
  Feedback.create(user_id: uid, rating: rat, transaction_id: tid, comment: com)
end
