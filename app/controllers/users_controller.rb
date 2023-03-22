class UsersController < ApplicationController
    def create
        # Create the user from params
        @user = User.new(user_params)
        if @user.save
          # Deliver the signup email
          UserMailer.user_created(@user).deliver_now
          redirect_to(@user, :notice => 'User created')
        else
          render :action => 'new'
        end
    
      end
    
     
      private
    
      def user_params
        params.require(:user).permit(:email, :login)
      end
    
end
