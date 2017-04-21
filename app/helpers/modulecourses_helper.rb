module ModulecoursesHelper
    
    def addmoduletostudent(module_id)
        @modulecourse = Modulecourse.find_by(id: module_id)
        @student = Student.find_by(user_id: current_user)
        
        if @student.module_course_id_1 == nil
          Student.update(@student.id, "module_course_id_1" => @modulecourse.id)
        elsif @student.module_course_id_2 == nil
          Student.update(@student.id, "module_course_id_2" => @modulecourse.id)
        elsif @student.module_course_id_3 == nil
          Student.update(@student.id, "module_course_id_3" => @modulecourse.id)
        elsif @student.module_course_id_4 == nil
          Student.update(@student.id, "module_course_id_4" => @modulecourse.id)
        elsif @student.module_course_id_5 == nil
          Student.update(@student.id, "module_course_id_5" => @modulecourse.id)
        end
    end
    
    def is_enrolled?(module_id)
        @modulecourse = Modulecourse.find_by(id: module_id)
        @student = Student.find_by(user_id: current_user)
        value = false
        if @student.module_course_id_1 == @modulecourse.id
          value = true
        elsif @student.module_course_id_2 == @modulecourse.id
          value = true
        elsif @student.module_course_id_3 == @modulecourse.id
          value = true
        elsif @student.module_course_id_4 == @modulecourse.id
          value = true
        elsif @student.module_course_id_5 == @modulecourse.id
          value = true
        end
        value
    end
    
    def withdrawmodule(module_id)
        @modulecourse = Modulecourse.find_by(id: module_id)
        @student = Student.find_by(user_id: current_user)
        
        if @student.module_course_id_1 == @modulecourse.id
          Student.update(@student.id, "module_course_id_1" => nil)
        end
        if @student.module_course_id_2 == @modulecourse.id
          Student.update(@student.id, "module_course_id_2" => nil)
        end
        if @student.module_course_id_3 == @modulecourse.id
          Student.update(@student.id, "module_course_id_3" => nil)
        end
        if @student.module_course_id_4 == @modulecourse.id
          Student.update(@student.id, "module_course_id_4" => nil)
        end
        if @student.module_course_id_5 == @modulecourse.id
          Student.update(@student.id, "module_course_id_5" => nil)
        end
    end
end
