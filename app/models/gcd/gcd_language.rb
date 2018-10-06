module GCD
  class GcdLanguage < ActiveRecord::Base
    self.table_name = 'stddata_language'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :code, :name
    end

  end
end
