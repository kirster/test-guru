class BadgeCriteriaCheck

  class << self

    def check_criterias(user)
      Badge.all.each do |badge|
        case badge.rule_name
          when 'Category' then category_rule(user, badge)
          when 'Level'    then level_rule(user, badge)
          when 'Attempt'  then attempt_rule(user, badge)
        end
      end
    end

    private

    def category_rule(user, badge)
      category = Category.find_by(title: badge.rule_value)
      user.badges.push(badge) if passed_category_rule?(user, category)
    end

    def level_rule(user, badge)
      level = badge.rule_value.to_i 
      user.badges.push(badge) if passed_level_rule?(user, level)
    end

    def attempt_rule(user, badge)
      attempt = badge.rule_value.to_i
      user.badges.push(badge) if passed_attempt_rule?(user, attempt)
    end

    def passed_category_rule?(user, category)
      user.tests.where('category_id=? AND test_passages.success=?', category.id, true)
                      .pluck(:title).uniq.count == Test.for_category(category.title).count
    end

    def passed_level_rule?(user, level)
      user.tests.where('level=? AND test_passages.success=?', level, true)
                      .pluck(:title).uniq.count == Test.for_level(level).count
    end

    def passed_attempt_rule?(user, attempt)
      title = user.test_passages.last.test.title
      user.tests.where('title=? AND test_passages.success=?', title, true).count == attempt
    end

  end

end