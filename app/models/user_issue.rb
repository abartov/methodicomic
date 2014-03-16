class UserIssue < ActiveRecord::Base
  belongs_to :tracking_user, class_name: :User, foreign_key: 'user_id'
  belongs_to :tracked_issue, class_name: 'GCD::GcdIssue', foreign_key: 'issue_id'
end
