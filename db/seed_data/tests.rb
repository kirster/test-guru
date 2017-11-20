tests = [
  ['Git basics', 1, 1, 1],
  ['Git branching', 2, 1, 2],
  ['Ruby beginner', 0, 2, 3],
  ['Ruby OOP', 3, 2, 4],
  ['SQL in Rails', 4, 2, 5],
  ['Algo basics', 5, 3, 6],
  ['Searching', 6, 3, 7]
]

tests.each do |title, level, category, user|
  Test.create!(title: title, level: level, category_id: category, user_id: user)
end