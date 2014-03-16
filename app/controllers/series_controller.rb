class SeriesController < ApplicationController
  def search
    # TODO: replace with more sophisticated search
    lang_id = GCD::GcdLanguage.where(code: current_user.default_language_code)[0].id # TODO: validate
    @matches = GCD::GcdSeries.where("name like ? and language_id = ?", "%#{params[:q]}%", lang_id).order(issue_count: :desc)
  end

  def list
  end

  def view
    @series = GCD::GcdSeries.find(params[:id])
    @issues = @series.issues.order(sort_code: :asc)
  end

  def follow
    @series = GCD::GcdSeries.find(params[:id])
    unless @series.nil?
      current_user.tracked_series << @series unless current_user.follows(@series)

      @tot_imported = 0
      @series.issues.each {|issue|
        # check if user happens to already track this issue
        unless current_user.tracks(issue)
          rel = UserIssue.new(tracking_user: current_user, tracked_issue: issue, finished: false, acquired: false)
          current_user.user_issues << rel
          issue.user_issues << rel
          @tot_imported += 1
        end
      }
      flash[:notice] = "#{@tot_imported} issues now added to your list."
    else
      flash[:error] = 'No such series'
    end
    redirect_to '/'
  end

  def unfollow
    @series = GCD::GcdSeries.find(params[:id])
    unless @series.nil?
      current_user.tracked_series.delete(@series) 
      flash[:notice] = "You are no longer following the series '#{@series.name}'."
    else
      flash[:error] = 'No such series'
    end
    redirect_to '/'
  end
end
