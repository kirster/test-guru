10.times { User.create(email: Faker::Internet.email) }

categories = %w[Git Backend Algorithms]
categories.each { |category| Category.create(title: category) }

tests = [
  ['Git basics', 1, 1],
  ['Git branching', 2, 1],
  ['Ruby beginner', 1, 2],
  ['Ruby OOP', 2, 2],
  ['SQL in Rails', 3, 2],
  ['Algo basics', 1, 3],
  ['Searching', 2, 3]
]

tests.each do |title, level, category|
  Test.create(title: title, level: level, category_id: category)
end

questions = [ 'How do you start Git repository?',
              'How do you determine the current state of the project?',
              'Command to put changed files to staging condition?',
              'How to show list of all the commits that have been made?',
              'How to create a new branch?',
              'How to show list of all branches?',
              'How to switch to master branch?',
              'Command to merge one branch to another?',
              "What is the datatype of 'one'?",
              "What does 'self' mean?",
              'What is the keyword for creating a new method?',
              'What type is :name?',
              'What is an object?',
              'What is a command for creating an object?',
              'What is the type of variable @@name?',
              'What is the keyword to define a ruby module?',
              'What SQL is generated to create a table in the database?',
              'What SQL is used to delete database?',
              'What attribute does find method use?',
              'What is the function that calls itself?',
              'Convert 1110 base-2 to the corresponding base-ten number',
              'Convert 63933 base-ten to the corresponding hexadecimal number',
              'What is n in O(n)?',
              'What is the average Big O performance of quicksort algorithm?',
              'What is the best Big O performance of bubble sort?',
              'What is the worst Big O performance of insertion sort?'
            ]

questions.each { |question| Question.create(body: question) }

answers =[{ body: 'git init', correct: true }, { body: 'git start' }, { body: 'git new' },
          { body: 'git log'}, { body: 'git status', correct: true}, { body: 'git init' },
          { body: 'git commit'}, { body: 'git checkout' }, { body: 'git add', correct: true },
          { body: 'git commit'}, { body: 'git add', correct: true }, { body: 'git status'},
          { body: 'git new branch'}, { body: 'git branch <name>', correct: true }, { body: 'git -b'},
          { body: 'git branches'}, { body: 'git branch', correct: true }, { body: 'git log'},
          { body: 'git master'}, { body: 'git checkout master', correct: true }, { body: 'git HEAD master'},
          { body: 'git merge <branch_name>', correct: true }, { body: 'git merge all'}, { body: 'git merge HEAD'},
          { body: 'integer'}, { body: 'float'}, { body: 'string', correct: true },
          { body: 'current object', correct: true }, { body: 'integer class method'}, { body: 'string class method' },
          { body: 'function'}, { body: 'def', correct: true }, { body: 'void' },
          { body: 'decimal' }, { body: 'string' }, { body: 'symbol', correct: true },
          { body: 'class' }, { body: 'instance of class', correct: true }, { body: 'module' },
          { body: 'void' }, { body: 'new', correct: true }, { body: 'object_id' },
          { body: 'global' }, { body: 'class', correct: true }, { body: 'instance' },
          { body: 'module', correct: true }, { body: 'class' }, { body: 'mixin' },
          { body: 'create database <name>' }, { body: 'create table <name>', correct: true }, { body: 'insert into <name>' },
          { body: 'drop database <name>', correct: true }, { body: 'delete database <name>' }, { body: 'delete db <name>' },
          { body: 'created_at' }, { body: 'id', correct: true }, { body: 'updated_at' },
          { body: 'recursion', correct: true }, { body: 'bubble sort' }, { body: 'binary tree' },
          { body: '10' }, { body: '14', correct: true }, { body: '12' },
          { body: 'DDF' }, { body: 'F9BD', correct: true }, { body: 'FF' },
          { body: 'number of operations', correct: true }, { body: 'estimated time in seconds' }, { body: 'argument' },
          { body: 'n*log(n)', correct: true }, { body: 'n' }, { body: 'n**2' },
          { body: 'n*log(n)' }, { body: 'n', correct: true }, { body: 'n**2' },
          { body: 'n*log(n)' }, { body: 'n' }, { body: 'n**2', correct: true } ]   

Answer.create(answers)