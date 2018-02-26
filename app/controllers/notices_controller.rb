class NoticesController < ApplicationController
  before_action :authenticate_account!
  PER = 10

  def show
    @notice = Notice.find(params[:id])
  end
end
