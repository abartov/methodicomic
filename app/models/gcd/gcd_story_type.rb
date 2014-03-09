module GCD
  class GcdStoryType < ActiveRecord::Base
    self.table_name = 'gcd_story_type'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :sort_code
    end

  end
end
