module GCD
  class GcdSeries < ActiveRecord::Base
    self.table_name = 'gcd_series'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :sort_name, :format, :year_began, :year_began_uncertain, :year_ended, :year_ended_uncertain, :publication_dates, :first_issue_id, :last_issue_id, :is_current, :publisher_id, :country_id, :language_id, :tracking_notes, :notes, :publication_notes, :has_gallery, :open_reserve, :issue_count, :created, :modified, :reserved, :deleted, :has_indicia_frequency, :has_isbn, :has_barcode, :has_issue_title, :has_volume, :is_comics_publication, :color, :dimensions, :paper_stock, :binding, :publishing_format, :has_rating
    end

    has_many :issues, class_name: 'GcdIssue', foreign_key: 'series_id', inverse_of: :series
    has_many :user_series, foreign_key: 'series_id'
    has_many :tracking_users, through: :user_series, class_name: 'User'
    belongs_to :publisher, class_name: 'GcdPublisher', foreign_key: 'publisher_id'
    belongs_to :language, class_name: 'GcdLanguage', foreign_key: 'language_id'
    belongs_to :country, class_name: 'GcdCountry', foreign_key: 'country_id'
    #has_and_belongs_to_many :users, class_name: 'User', join_table: 'gcd_series_users'
  end
end
