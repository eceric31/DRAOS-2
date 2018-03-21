class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @role = Role.find_by role: "Normal User"
        @user =  @role.users.new(user_params)
        if @user.save
            UserNotifierMailer.send_signup_email(@user).deliver
            flash[:success] = "Please confirm your email address to continue!"
            redirect_to '/login'
        else
            flash[:error] = "Ooooppss, something went wrong!"
            render 'new'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to '/admin/users'
    end

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
          user.email_activate
          flash[:success] = "Your email has been confirmed. Please sign in to continue."
          redirect_to '/login'
        else
          @error = "Sorry. User does not exist"
          redirect_to '/signup'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
end
