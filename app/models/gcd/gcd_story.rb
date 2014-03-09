module GCD
  class GcdStory < ActiveRecord::Base
    self.table_name = 'gcd_story'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :title, :title_inferred, :feature, :sequence_number, :page_count, :issue_id, :script, :pencils, :inks, :colors, :letters, :editing, :genre, :characters, :synopsis, :reprint_notes, :created, :modified, :notes, :no_script, :no_pencils, :no_inks, :no_colors, :no_letters, :no_editing, :page_count_uncertain, :type_id, :job_number, :reserved, :deleted
    end

  end
end
