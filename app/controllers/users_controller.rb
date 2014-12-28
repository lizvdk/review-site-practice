class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to root_url, notice: "Bye! Your account has been successfully
                                    cancelled. We hope to see you again soon."
    end
  end
end
