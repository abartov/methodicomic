module GCD
  class GcdIssueReprint < ActiveRecord::Base
    self.table_name = 'gcd_issue_reprint'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :origin_issue_id, :target_issue_id, :notes, :reserved
    end

  end
end
