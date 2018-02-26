class ProjectsController < ApplicationController
	before_action :authenticate_account!, only: [:new, :create]
  PER = 10

  def index
    @q = Project.ransack(params[:q])
    @project = @q.result.select(:id,:project_name,:project_category,:maker,:product,:image1,:amount_of_money,:account_id,:project_from,:project_to).where('project_to > ?', Time.now).order('project_to desc').page(params[:page]).per(PER)
    @project_category = Code.select(:description).where('content = ?', 'project_category')
  end

	def new
		@project = Project.new
		@account = current_account
    @project_category = Code.select(:description).where('content = ?', 'project_category')
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project, notice:'プロジェクトを作成しました'
		else
      @account = current_account
      @project_category = Code.select(:description).where('content = ?', 'project_category')
			render 'new'
		end
	end

	def show
		@project = Project.find(params[:id])
    #@project_status = Code.select(:content_no).where('content = ? and description = ?', 'project_status', '支払い期間中')
    @question = @project.questions
    @join = @project.joins
    @project_joiner = @join.size
    @project_money = @project.amount_of_money * @join.sum(:number_of_orders)
    @project_joiner_more_than = 100
    @project_money_more_than = 1000000
    @now_joiner = @project_joiner_more_than - @project_joiner
    @now_money = @project_money_more_than - @project_money
	end

	private
    def project_params
    	params.require(:project).permit(
          :project_name,
          :project_category,
          :maker,
          :product,
          :option,
          :image1,
          :image1_cache,
          :remove_image1,
          :image2,
          :image2_cache,
          :remove_image2,
          :image3,
          :image3_cache,
          :remove_image3,
          :image4,
          :image4_cache,
          :remove_image4,
          :image5,
          :image5_cache,
          :remove_image5,
          :attraction,
          :reason,
          :amount_of_money,
          #:way_of_purchase,
          #:way_of_payment,
          :account_id,
          :project_from,
          :project_to
        )
    end
end
