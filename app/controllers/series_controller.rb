class SeriesController < ApplicationController
  def search
    # TODO: replace with more sophisticated search
    lang_id = GCD::GcdLanguage.where(code: current_user.language)[0].id # TODO: validate
    @matches = GCD::GcdSeries.joins(:publisher, :language, :country).includes([:publisher, :language, :country]).where("gcd_series.name like ? and is_comics_publication = 1 and language_id = ?", "%#{params[:q]}%", lang_id).order(issue_count: :desc).page params[:page]
  end

  def list
  end

  def view
    @series = GCD::GcdSeries.find(params[:id])
    @issues = @series.issues.order(sort_code: :asc).page params[:page]
  end

  def follow
    @series = GCD::GcdSeries.find(params[:id])
    unless @series.nil?
      current_user.tracked_series << @series unless current_user.follows(@series)

      @tot_imported = 0
      @series.issues.each {|issue|
        # check if user happens to already track this issue
        unless issue.variant_of_id != nil or current_user.tracks(issue)
          current_user.track_issue(issue.id)
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
