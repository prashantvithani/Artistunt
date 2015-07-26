class UsersController < ApplicationController
  before_action :authenticate_user!
  def history
    @history = History.where(user_id: current_user.id).order(count: 'desc').paginate(page: params[:page], per_page: 10)
  end
end
