module GCD
  class GcdBrandEmblemGroup < ActiveRecord::Base
    self.table_name = 'gcd_brand_emblem_group'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :brand_id, :brandgroup_id
    end

  end
end
