class PurchasesController < ApplicationController
  before_action :authenticate_account!

  def detail
  	@project = Project.includes(:joins).find(params[:project_id])
  	@number_of_orders = @project.joins.select(:number_of_orders).where('account_id = ?', current_account.id)
  	@user = User.select(:account_id).where('account_id = ?', current_account.id)
  end

  def confirm
  	@project = Project.includes(:joins).find(params[:project_id])
  	@number_of_orders = @project.joins.select(:number_of_orders).where('account_id = ?', current_account.id)
  	@purchase = Purchase.new
  end

  def complete
  	@purchase = Purchase.new(purchase_params)
  	if @purchase.save
  	  render :complete, notice:'購入手続きが完了しました'
  	else
      @project = Project.includes(:joins).find(params[:project_id])
      @number_of_orders = @project.joins.select(:number_of_orders).where('account_id = ?', current_account.id)
  	  render 'confirm'
  	end
  end

private
    def purchase_params
      params.require(:purchase).permit(
        :project_id,
        :account_id,
        :number_of_orders,
        :total_amount,
        :due_date
        )
    end
end
