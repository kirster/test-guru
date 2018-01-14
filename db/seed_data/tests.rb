tests = [
  ['Git basics', 1, 1, 1, 1],
  ['Git branching', 2, 1, 2, 1],
  ['Ruby beginner', 0, 2, 3, 1],
  ['Ruby OOP', 3, 2, 4, 1],
  ['SQL in Rails', 4, 2, 5, 2],
  ['Algo basics', 5, 3, 6, 3],
  ['Searching', 6, 3, 7, 2]
]

tests.each do |title, level, category, user, timer|
  Test.create!(title: title, level: level, category_id: category, user_id: user, timer: timer)
end