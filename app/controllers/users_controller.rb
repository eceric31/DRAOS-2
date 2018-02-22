class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @role = Role.find_by role: "Normal User"
        @user =  @role.users.new(user_params)
        if @user.save
            redirect_to '/login'
        else
            redirect_to 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
end
