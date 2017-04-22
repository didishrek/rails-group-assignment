class GradesController < ApplicationController
    before_action :logged_in_user, only: [:setgradetostudent]
    before_action :correct_user, only: [:setgradetostudent]
    
    def setgradetostudent
        module_id = params[:module_id]
        @modulecourse = Modulecourse.find_by(id: module_id)
        if @modulecourse
            @students = Student.where("module_course_id_1 = ? OR module_course_id_2 = ? OR module_course_id_3 = ? OR module_course_id_4 = ? OR module_course_id_5 = ?", module_id, module_id, module_id, module_id, module_id)
            @grade = Grade.new
        else
            redirect_back_or current_user
        end
    end
    
    def create
        @grade = Grade.new(grade_params_create)
        respond_to do |format|
            if @grade.save
                format.html { redirect_to setgradetostudent_path("module_id" => params[:grade][:module_course_id]) , notice: 'Grade was successfully created.' }
            else
                format.html { redirect_to setgradetostudent_path("module_id" => params[:grade][:module_course_id]) , notice: 'Cannot save this grade' }
            end
        end
    end
    
    def update
        puts params
        @fgrade = findgrade(params[:grade][:user_id], params[:grade][:module_course_id])
        respond_to do |format|
            if @fgrade.update("grade" => params[:grade][:grade])
                format.html { redirect_to setgradetostudent_path("module_id" => params[:grade][:module_course_id]) , notice: 'Grade was successfully modified.' }
            else
                format.html { redirect_to setgradetostudent_path("module_id" => params[:grade][:module_course_id])  }
            end
        end
    end
    
    
    
    private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to root_url
      end
    end
    
    def grade_params_create
      params.require(:grade).permit(:user_id, :module_course_id, :grade)
    end
    
    def correct_user
        redirect_to(current_user) unless logged_as_lecturer? and find_lecturer_link_to_module(params[:module_id]).id == current_user.id
    end
end
