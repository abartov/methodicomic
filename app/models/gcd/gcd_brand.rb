module GCD
  class GcdBrand < ActiveRecord::Base
    self.table_name = 'gcd_brand'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :parent_id, :year_began, :year_ended, :notes, :url, :issue_count, :created, :modified, :reserved, :deleted, :year_began_uncertain, :year_ended_uncertain
    end

  end
end
