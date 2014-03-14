class User < ActiveRecord::Base
  #has_and_belongs_to_many :tracked_series, class_name: 'GCD::GcdSeries', join_table: 'gcd_series_users'
  has_many :user_series
  has_many :tracked_series, through: :user_series, class_name: 'GCD::GcdSeries'

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) unless auth.credentials.expires_at.nil?
      user.default_language = 'en' # TODO: unhardcode this -- glean from auth? -- definitely let user pick
      user.save!
    end
  end
  def follows(series)
    tracked_series.include?(series)
  end
end
