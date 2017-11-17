answers =[{ body: 'git init', correct: true, question_id: 1 }, 
          { body: 'git start', question_id: 1 }, 
          { body: 'git new', question_id: 1 },

          { body: 'git log', question_id: 2 },
          { body: 'git status', correct: true, question_id: 2 },
          { body: 'git init', question_id: 2 },

          { body: 'git commit', question_id: 3 },
          { body: 'git checkout', question_id: 3 }, 
          { body: 'git add', correct: true, question_id: 3 },

          { body: 'git commit', question_id: 4}, 
          { body: 'git add', correct: true, question_id: 4 }, 
          { body: 'git status', question_id: 4},

          { body: 'git new branch', question_id: 5 }, 
          { body: 'git branch <name>', correct: true, question_id: 5 },
          { body: 'git -b', question_id: 5},

          { body: 'git branches', question_id: 6 }, 
          { body: 'git branch', correct: true, question_id: 6 }, 
          { body: 'git log', question_id: 6 },

          { body: 'git master', question_id: 7 }, 
          { body: 'git checkout master', correct: true, question_id: 7 }, 
          { body: 'git HEAD master', question_id: 7 },

          { body: 'git merge <branch_name>', correct: true, question_id: 8 },
          { body: 'git merge all', question_id: 8 }, 
          { body: 'git merge HEAD', question_id: 8 },

          { body: 'integer', question_id: 9 }, 
          { body: 'float', question_id: 9 }, 
          { body: 'string', correct: true, question_id: 9 },

          { body: 'current object', correct: true, question_id: 10 }, 
          { body: 'integer class method', question_id: 10 }, 
          { body: 'string class method', question_id: 10 },

          { body: 'function', question_id: 11 }, 
          { body: 'def', correct: true, question_id: 11 },
          { body: 'void', question_id: 11 },

          { body: 'decimal', question_id: 12 }, 
          { body: 'string', question_id: 12 }, 
          { body: 'symbol', correct: true, question_id: 12 },

          { body: 'class', question_id: 13 }, 
          { body: 'instance of class', correct: true, question_id: 13 }, 
          { body: 'module', question_id: 13 },

          { body: 'void', question_id: 14 }, 
          { body: 'new', correct: true, question_id: 14 }, 
          { body: 'object_id', question_id: 14 },

          { body: 'global', question_id: 15 }, 
          { body: 'class', correct: true, question_id: 15 }, 
          { body: 'instance', question_id: 15  },

          { body: 'module', correct: true, question_id: 16 }, 
          { body: 'class', question_id: 16 }, 
          { body: 'mixin', question_id: 16 },

          { body: 'create database <name>', question_id: 17 }, 
          { body: 'create table <name>', correct: true, question_id: 17 }, 
          { body: 'insert into <name>', question_id: 17 },

          { body: 'drop database <name>', correct: true, question_id: 18 }, 
          { body: 'delete database <name>', question_id: 18 }, 
          { body: 'delete db <name>', question_id: 18 },

          { body: 'created_at', question_id: 19 }, 
          { body: 'id', correct: true, question_id: 19 }, 
          { body: 'updated_at', question_id: 19 },

          { body: 'recursion', correct: true, question_id: 20 }, 
          { body: 'bubble sort', question_id: 20 }, 
          { body: 'binary tree', question_id: 20 },

          { body: '10', question_id: 21 }, 
          { body: '14', correct: true, question_id: 21 }, 
          { body: '12', question_id: 21 },

          { body: 'DDF', question_id: 22 }, 
          { body: 'F9BD', correct: true, question_id: 22 }, 
          { body: 'FF', question_id: 22 },

          { body: 'number of operations', correct: true, question_id: 23 }, 
          { body: 'estimated time in seconds', question_id: 23 }, 
          { body: 'argument', question_id: 23 },

          { body: 'n*log(n)', correct: true, question_id: 24 },
          { body: 'n', question_id: 24 }, 
          { body: 'n**2', question_id: 24 },

          { body: 'n*log(n)',question_id: 25 }, 
          { body: 'n', correct: true, question_id: 25 }, 
          { body: 'n**2', question_id: 25 },

          { body: 'n*log(n)', question_id: 26 }, 
          { body: 'n', question_id: 26}, 
          { body: 'n**2', correct: true, question_id: 26 } ]   

Answer.create!(answers)