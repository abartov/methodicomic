class IssuesController < ApplicationController
  def list
  end
  def search_by_writer
    @series = {}
    if params[:page]
      @issues = GCD::GcdIssue.joins(:stories).includes(:series).where('script like ?', "%#{params[:q]}%").distinct(:issue_id).page(params[:page])
    else
      @issues = GCD::GcdIssue.joins(:stories).includes(:series).where('script like ?', "%#{params[:q]}%").distinct(:issue_id)
      @issues.each do |issue|
        @series[issue.series] = 0 unless @series[issue.series]
        @series[issue.series] += 1
      end
      @series = @series.sort_by{|k, v| -v} # sort by descending number of issues by this writer
      @issues = GCD::GcdIssue.joins(:stories).includes(:series).where('script like ?', "%#{params[:q]}%").distinct(:issue_id).page(params[:page]) # now bring just one page

    end
  end
  def search_by_series_and_writer
    @issues = GCD::GcdIssue.joins(:stories, :series).includes(:series).where(series_id: params[:series]).where('script like ?', "%#{params[:writer]}%").distinct(:issue_id)
    @series = GCD::GcdSeries.find(params[:series])
  end
  def unread
    unless current_user.nil?
      @issues = current_user.unread_issues.page params[:page]
    else
      redirect_to root_url, :flash => {:error => 'Must be logged in'}
    end
  end
  def unacquired
    unless current_user.nil?
      @issues = current_user.unacquired_issues.page params[:page]
    else
      redirect_to root_url, :flash => {:error => 'Must be logged in'}
    end
  end
  def view
    @issue = GCD::GcdIssue.find(params[:id])
    if @issue.nil?
      redirect_to root_url, :flash => {:error => 'No such issue'}
    end
  end

  def read_next
    if do_toggle_read
      @series = @issue.tracked_issue.series # grab series from previous issue
      @issue = current_user.unread_for_series(@series).first # this should now be the *next* issue to read, now that we've marked this one as read
      respond_to do |format|
        format.js # AJAX
      end
    end
  end

  def toggle_read
    if do_toggle_read
      head :ok # AJAX
    end
  end

  def toggle_acquired
    @issue = current_user.issue_data_by_issue_id(params[:id])
    unless @issue.nil?
      @issue.toggle!(:acquired)
      head :ok # AJAX
    else
      render :status => 500
    end
  end

  def toggle_track
    if current_user.tracked_issue?(params[:id])
      current_user.untrack_issue(params[:id])
    else
      current_user.track_issue(params[:id])
    end
    head :ok # AJAX
  end

  def batch_set
    byebug
    @op = params[:op]
    @ttag = params[:ttag]
    case @op
    when 'tracked'
      current_user.user_issues.where(issue_id: params[:ids].map{|id| id.to_i}).destroy_all
    when 'acquired'
      current_user.user_issues.where(issue_id: params[:ids].map{|id| id.to_i}).update_all(acquired: (params[:all_acquired].nil? ? false : true))
    when 'finished'
      current_user.user_issues.where(issue_id: params[:ids].map{|id| id.to_i}).update_all(finished: (params[:all_finished].nil? ? false : true))
    end
    respond_to do |format|
      format.js # AJAX
    end
end

  protected

  def do_toggle_read
    @issue = current_user.issue_data_by_issue_id(params[:id])
    unless @issue.nil?
      @issue.toggle!(:finished)
      return true
    else
      render :status => 500
      return false
    end
  end
end
