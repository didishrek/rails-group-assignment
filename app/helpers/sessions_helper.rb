module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
       !current_user.nil?
    end
    
    def logged_as_student?
        !current_user.nil? and current_user.type_user.eql? "student"
    end
    
    def logged_as_lecturer?
        !current_user.nil? and current_user.type_user.eql? "lecturer"
    end
    
    def logged_as_moduleadmin?
        !current_user.nil? and current_user.type_user.eql? "moduleadmin"
    end
       
    def logged_as_programadmin?
        !current_user.nil? and current_user.type_user.eql? "programadmin"
    end
    
    def remember(user)
       cookies.permanent.signed[:user_id] = user_id
       cookies.permanent[:remember_token] = user.remember_token
    end
    
    def forget(user)
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    def redirect_back_or(default)
       redirect_to(session[:forwarding_url] || default)
       session.delete(:forwarding_url)
    end
    
    def store_location
       session[:forwarding_url] = request.url if request.get? 
    end
end
