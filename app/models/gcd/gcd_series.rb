module GCD
  class GcdSeries < ActiveRecord::Base
    self.table_name = 'gcd_series'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :sort_name, :format, :year_began, :year_began_uncertain, :year_ended, :year_ended_uncertain, :publication_dates, :first_issue_id, :last_issue_id, :is_current, :publisher_id, :country_id, :language_id, :tracking_notes, :notes, :publication_notes, :has_gallery, :open_reserve, :issue_count, :created, :modified, :reserved, :deleted, :has_indicia_frequency, :has_isbn, :has_barcode, :has_issue_title, :has_volume, :is_comics_publication, :color, :dimensions, :paper_stock, :binding, :publishing_format, :has_rating
    end
    
    has_many :issues, class_name: 'GcdIssue', foreign_key: 'series_id', inverse_of: :series
  end
end
