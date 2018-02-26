class AccountsController < ApplicationController
  before_action :authenticate_account!
  PER = 10

  def show
  	@user = User.where('account_id = ?', current_account.id) #find_by(account_id: current_account.id)
    @notice = Notice.where(to_user: [nil , @user] ).order('id desc').page(params[:page]).per(PER)
  end

  def now
  	@user = User.where('account_id = ?', current_account.id)
    @project = Project.joins(:joins).select('projects.*').where('joins.account_id = ? AND projects.project_to > ?', current_account.id, Time.now).order('id desc').page(params[:page]).per(PER)
  end

  def before
  	@user = User.where('account_id = ?', current_account.id)
  	@project = Project.joins(:joins).select('projects.*').where('joins.account_id = ? AND projects.project_to < ?', current_account.id, Time.now).order('id desc').page(params[:page]).per(PER)
  end

  def result
  	@user = User.where('account_id = ?', current_account.id)
  	@project = Project.joins(:joins).select('projects.*').where('joins.account_id = ? AND projects.status = ?', current_account.id, '5').order('id desc').page(params[:page]).per(PER)
  end
end