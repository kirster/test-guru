categories = %w[Git Backend Algorithms]
categories.each { |category| Category.create!(title: category) }