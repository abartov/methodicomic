module GCD
  class GcdBrandGroup < ActiveRecord::Base
    self.table_name = 'gcd_brand_group'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :year_began, :year_ended, :year_began_uncertain, :year_ended_uncertain, :notes, :url, :reserved, :created, :modified, :deleted, :parent_id, :issue_count
    end

  end
end
