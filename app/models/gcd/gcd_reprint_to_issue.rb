module GCD
  class GcdReprintToIssue < ActiveRecord::Base
    self.table_name = 'gcd_reprint_to_issue'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :origin_id, :target_issue_id, :notes, :reserved
    end

  end
end
