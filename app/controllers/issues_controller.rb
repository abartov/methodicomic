class IssuesController < ApplicationController
  def list
  end
  def search_by_writer
    @issue_ids = GCD::GcdStory.where('script like ?', "%#{params[:q]}%").distinct(:issue_id).page(params[:page])
    ids = @issue_ids.pluck(:issue_id)
    @issues = GCD::GcdIssue.find(ids)
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
