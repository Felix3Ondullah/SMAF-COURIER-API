# class SessionsController < ApplicationController
#     skip_before_action :authorized, only: :create
   
        
#     def create 
#         user = User.find_by(username: params[:username])
#         if user&.authenticate(params[:password])
#         session[:user_id] = user.id
#         render json: user, status: :created
#         else 
#             render json: { error: "Invalid username or password" }, status: :unauthorized
#         end
#      end

#      def destroy 
#         session.delete :user_id
#         head :no_content
#         # redirect_to '/' 
#      end
# end

class SessionsController < ApplicationController
    #login
    def create
       user = User.find_by(username: params[:username])
       if user&.authenticate(params[:password])
           session[:user_id] = user.id
           render json: user
       else
           render json: { errors: ["Invalid username or password"] }, status: :unauthorized
       end
     end
 
     #logout
     def destroy 
                session.delete :user_id
                head :no_content
                redirect_to '/' 
    
        end
        
 end