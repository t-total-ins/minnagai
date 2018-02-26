class JoinsController < ApplicationController
  before_action :authenticate_account!
  before_action :correct_user, only: [:edit, :update]
  
  def new
  	@join = Join.new
    @project_id = params[:project_id]
  end

  def create
  	@join = Join.create(join_params)
  	if @join.save
  		redirect_to project_path(@join.project_id), notice:'プロジェクトに参加しました'
  	else
      @project_id = params[:project_id]
  		render 'new'
  	end
  end

  def edit
    @project_id = params[:project_id]
  end

  def update
    if @join.update(join_params)
      redirect_to project_path(@join.project_id), notice:'プロジェクト参加内容を変更しました'
    else
      @project_id = params[:project_id]
      render 'edit'
    end
  end

  def destroy
    join = Join.find(params[:id])
    join.destroy!
    redirect_to  project_path(join.project_id), notice:'このプロジェクトへの参加を取り消しました'
  end

private
  def join_params
  	params.require(:join).permit(
      :project_id,
      :account_id,
  	  :purpose,
      :join_maker,
      :join_product,
      :join_attract,
      :number_of_orders,
      :join_option
  	)
  end

  def correct_user
    @join = Join.find(params[:id])
    redirect_to(root_path) unless current_user?(@join)
  end

  def current_user?(user)
    user.account_id == current_account.id
  end
end
