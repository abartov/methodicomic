module GCD
  class GcdCountry < ActiveRecord::Base
    self.table_name = 'stddata_country'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :code, :name
    end

  end
end
