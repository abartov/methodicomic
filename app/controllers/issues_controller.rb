class IssuesController < ApplicationController
  def list
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

  def toggle_read
    @issue = current_user.issue_data_by_issue_id(params[:id])
    unless @issue.nil?
      @issue.toggle!(:finished)
    end
    render :nothing => true # AJAX
  end

  def toggle_acquired
    @issue = current_user.issue_data_by_issue_id(params[:id])
    unless @issue.nil?
      @issue.toggle!(:acquired)
    end
    render :nothing => true # AJAX
  end

end
