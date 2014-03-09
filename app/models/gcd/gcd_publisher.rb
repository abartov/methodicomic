module GCD
  class GcdPublisher < ActiveRecord::Base
    self.table_name = 'gcd_publisher'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :country_id, :year_began, :year_ended, :notes, :url, :is_master, :parent_id, :imprint_count, :brand_count, :indicia_publisher_count, :series_count, :created, :modified, :issue_count, :reserved, :deleted, :year_began_uncertain, :year_ended_uncertain
    end

  end
end
