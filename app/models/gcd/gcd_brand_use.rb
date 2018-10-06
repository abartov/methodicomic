module GCD
  class GcdBrandUse < ActiveRecord::Base
    self.table_name = 'gcd_brand_use'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :publisher_id, :emblem_id, :year_began, :year_ended, :year_began_uncertain, :year_ended_uncertain, :notes, :reserved, :created, :modified
    end

  end
end
