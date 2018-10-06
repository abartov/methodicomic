class User < ActiveRecord::Base
  #has_and_belongs_to_many :tracked_series, class_name: 'GCD::GcdSeries', join_table: 'gcd_series_users'
  has_many :user_series
  has_many :tracked_series, through: :user_series, class_name: 'GCD::GcdSeries'

  has_many :user_issues
  has_many :tracked_issues, through: :user_issues, class_name: 'GCD::GcdIssue'

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) unless auth.credentials.expires_at.nil?
      user.default_language_code = 'en' # TODO: unhardcode this -- glean from auth? -- definitely let user pick
      user.save!
    end
  end
  def follows(series)
    tracked_series.include?(series)
  end
  def tracks(issue)
    tracked_issues.include?(issue)
  end
  def unread_issue_count
    user_issues.where(finished: false).count
  end
  def read_issue_count
    user_issues.where(finished: true).count
  end
  def unacquired_issue_count
    user_issues.where(acquired: false).count
  end
  def unacquired_issues
    tracked_issues.includes('user_issues').where(user_issues: {acquired: false})
  end
  def unread_issues
    tracked_issues.includes('user_issues').where(user_issues: {finished:false})
  end
  def read_issues
    tracked_issues.includes('user_issues').where(user_issues: {finished: true})
  end
  def unread_for_series(series)
    tracked_issues.includes('user_issues').where(series_id: series.id, user_issues: {finished: false})
  end
  def read_for_series(series)
    tracked_issues.includes('user_issues').where(series_id: series.id, user_issues: {finished: true})
  end
  def tracked_issue?(id)
    rel = user_issues.where(issue_id: id)
    return(not rel.empty?)
  end
  def untrack_issue(id)
    rel = user_issues.where(issue_id: id)
    unless rel.empty?
      rel[0].destroy!
    end
  end
  def track_issue(id)
    issue = GCD::GcdIssue.find(id)
    unless issue.nil?
      rel = UserIssue.new(tracking_user: self, tracked_issue: issue, finished: false, acquired: false)
      user_issues << rel
      issue.user_issues << rel
    else
      raise Exception
    end
    return rel
  end
  def issue_data_by_issue_id(id)
    ret = user_issues.find_by_issue_id(id)
    if ret.nil?
      ret = track_issue(id) # start tracking this individual issue if necessary!
    end
    return ret
  end
  def issue_data_by_issue(issue)
    user_issues.find_by_issue_id(issue.id)
  end
  def issue_read?(issue)
    rel = user_issues.find_by_issue_id(issue.id)
    return false if rel.nil?
    return rel.finished
  end
  def issue_acquired?(issue)
    rel = user_issues.find_by_issue_id(issue.id)
    return false if rel.nil?
    return rel.acquired
  end
  def mark_issue_read(issue)
    rel = user_issues.where(issue_id: issue.id)
    unless rel.nil?
      rel.finished = true
      rel.finished_on = Date.today
      rel.save!
      return true
    else
      return false
    end
  end
  def mark_issue_unread(issue)
    rel = user_issues.where(issue_id: issue.id)
    unless rel.nil?
      rel.finished = false
      rel.finished_on = nil
      rel.save!
      return true
    else
      return false
    end
  end
end
