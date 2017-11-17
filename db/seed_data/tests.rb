tests = [
  ['Git basics', 1, 1, 1],
  ['Git branching', 2, 1, 2],
  ['Ruby beginner', 1, 2, 3],
  ['Ruby OOP', 2, 2, 4],
  ['SQL in Rails', 3, 2, 5],
  ['Algo basics', 1, 3, 6],
  ['Searching', 2, 3, 7]
]

tests.each do |title, level, category, user|
  Test.create!(title: title, level: level, category_id: category, user_id: user)
end