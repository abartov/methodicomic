class SeriesController < ApplicationController
  def search
    # TODO: replace with more sophisticated search
    lang_id = GCD::GcdLanguage.where(code: current_user.default_language_code)[0].id # TODO: validate
    @matches = GCD::GcdSeries.where("name like ? and language_id = ?", "%#{params[:q]}%", lang_id).order(issue_count: :desc)
  end

  def list
  end

  def view
  end

  def follow
  end

  def unfollow
  end
end
