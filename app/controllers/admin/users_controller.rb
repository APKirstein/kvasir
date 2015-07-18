module Admin
  class UsersController < ApplicationController
    before_filter :authorize_admin!

    def index
      @users = User.all.page(params[:page])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(admin: 't')
        flash[:success] = 'Changes saved successfully'
        redirect_to admin_users_path
      else
        flash[:notice] = @restaurant.errors.full_messages.join(". ")
        redirect_to admin_users_path
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "Successfully deleted #{@user.username}!"
      redirect_to admin_users_path
    end
  end
end
