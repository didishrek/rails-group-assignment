class StudentsController < ApplicationController
    def search_by_student_number
        id = params[:student_number].to_i
        @student = Student.find_by(student_number: id)
        if @student
            @studentuser = User.find_by(id: @student.user_id)
            redirect_to @studentuser
        else
            redirect_back_or(current_user)
        end
    end
    
    def search_by_student_name
        pname = params[:name]
        @fusers = User.where('name LIKE ?', "%#{pname}%")
        @fuser = @fusers.first unless @fusers.nil?
        if @fuser
            @student = Student.find_by(user_id: @fuser.id)
            if @student
                redirect_to @fuser
            else
                redirect_back_or(current_user)
            end
        else
            redirect_back_or(current_user)
        end
    end
end
