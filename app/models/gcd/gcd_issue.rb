module GCD
  class GcdIssue < ActiveRecord::Base
    self.table_name = 'gcd_issue'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :number, :volume, :no_volume, :display_volume_with_number, :series_id, :indicia_publisher_id, :indicia_pub_not_printed, :brand_id, :no_brand, :publication_date, :key_date, :sort_code, :price, :page_count, :page_count_uncertain, :indicia_frequency, :no_indicia_frequency, :editing, :no_editing, :notes, :created, :modified, :reserved, :deleted, :is_indexed, :isbn, :valid_isbn, :no_isbn, :variant_of_id, :variant_name, :barcode, :no_barcode, :title, :no_title, :on_sale_date, :on_sale_date_uncertain, :rating, :no_rating
    end

    belongs_to :series, class_name: 'GcdSeries', foreign_key: 'series_id', inverse_of: :issues

    ## would we ever even need this direction of the relationship?
    has_many :user_issues, foreign_key: 'issue_id'
    #has_many :tracking_users, through: :user_issues, class_name: 'User'
    has_many :stories, class_name: 'GcdStory', foreign_key: 'issue_id'
  end
end
