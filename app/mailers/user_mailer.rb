class UserMailer < ApplicationMailer
    
    def user_created(user)
        @user = user
        
        @url  = 'https://starfish-app-3xk6j.ondigitalocean.app/' 
       # @user = User
        #@greeting = "Hi"
    
        mail(
          from: "leboncoindudessin@gmail.com",
           to: @user.email,
           #cc: User.all.pluck(:email),
           #bcc: "secret@jerry.com",
           subject: "Bienvenue sur le bon coin du dessin" 
         )
      end
    
end
