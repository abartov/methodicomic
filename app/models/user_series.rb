class UserSeries < ActiveRecord::Base
  belongs_to :tracking_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :tracked_series, class_name: 'GCD::GcdSeries', foreign_key: 'series_id'
end
