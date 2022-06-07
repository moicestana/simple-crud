class AuthController < ApplicationController

    def form_login

    end

    def login
        username = params[:username]
        password = params[:password]
        
        if user = User.find_by(username: username)
            if user == User.find_by(username: password)

                # membuat session dengan key = :user_id
                session[:user_id] = user.id
                redirect_to root_path, notice: "Welcome, #{user.username}"
            else
                redirect_to form_login_path, alert: "Password tidak sesuai"
            end
        else
            redirect_to form_login_path, alert: "Username tidak ditemukan"
        end
        
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path, notice: "Anda telah logout"
    end
end