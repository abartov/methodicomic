module GCD
  class GcdReprint < ActiveRecord::Base
    self.table_name = 'gcd_reprint'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :origin_id, :target_id, :notes, :reserved
    end

  end
end
