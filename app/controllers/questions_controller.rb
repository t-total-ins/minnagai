class QuestionsController < ApplicationController
  before_action :authenticate_account!, only: [:new, :create]

  def new
    @question = Question.new
    @project = Project.find(params[:project_id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to project_path(@question.project_id), notice:'投稿しました'
    else
      @project = Project.find(params[:project_id])
      render 'new'
    end
  end

  private
    def question_params
      params.require(:question).permit(
        :title,
        :content,
        :q_and_a,
        :project_id,
        :account_id
        )
    end
end
