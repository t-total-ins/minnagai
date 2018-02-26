class UsersController < ApplicationController
	before_action :authenticate_account!
	before_action :correct_user, only: [:edit, :update]

	def new
		@user = User.new
	end
	
	def create
		@user = User.create(user_params)
		if @user.save
			redirect_to accounts_show_path(@user), notice:'登録完了しました'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		
		if @user.update(user_params)
			redirect_to accounts_show_path(@user), notice:'登録内容を変更しました'
		else
			@current_account = current_account
			render 'edit'
		end
	end

private
    def user_params
      params.require(:user).permit(
        :account_id,
        :first_name,
        :name,
        :first_name_k,
        :name_k,
        :pref,
        :city,
        :address,
        :post_number,
        #:pref_k,
        #:city_k,
        #:address_k,
        :tel,
        :mail,
        :birth,
        :sex
        )
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def current_user?(user)
      user.account_id == current_account.id
    end
end
