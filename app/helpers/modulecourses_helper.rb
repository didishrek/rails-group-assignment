module ModulecoursesHelper
    
  def canstudentenroll?(program_id)
    program = Program.find_by(id: program_id)
    now = Time.now
    if now < program.inscription_limit
      true
    else
      false
    end
  end
    
  def hasenoughmodule?(user_id)
    student = Student.find_by(user_id: user_id)
    count = 0
    if !student.module_course_id_1.nil?
      count+=1
    end
    if !student.module_course_id_2.nil?
      count+=1
    end
    if !student.module_course_id_3.nil?
      count+=1
    end
    if !student.module_course_id_4.nil?
      count+=1
    end
    if !student.module_course_id_5.nil?
      count+=1
    end
    p "count => " + count.to_s
    if (count >= 3)
      true
    else
      false
    end
  end
    
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
  
  def addmoduletolecturer(module_id, lecturer_id)
    if lecturer_id.eql? ""
      @flecturers = Lecturer.where("module_course_id_1 = ? OR module_course_id_2 = ? OR module_course_id_3 = ?", module_id, module_id, module_id)
      @flecturer = @flecturers.first unless @flecturers.nil?
      if !@flecturer.nil?
        if @flecturer.module_course_id_1 == module_id.to_i
          Lecturer.update(@flecturer.id, "module_course_id_1" => nil)
        end
        if @flecturer.module_course_id_2 == module_id.to_i
          Lecturer.update(@flecturer.id, "module_course_id_2" => nil)
        end
        if @flecturer.module_course_id_3 == module_id.to_i
          Lecturer.update(@flecturer.id, "module_course_id_3" => nil)
        end
      end
    else
      @modulecourse = Modulecourse.find_by(id: module_id)
      @user = User.find_by(id: lecturer_id)
      @lecturer = Lecturer.find_by(user_id: @user.id)
      
      if @lecturer.module_course_id_1 == nil
        Lecturer.update(@lecturer.id, "module_course_id_1" => @modulecourse.id)
      elsif @lecturer.module_course_id_2 == nil
        Lecturer.update(@lecturer.id, "module_course_id_2" => @modulecourse.id)
      elsif @lecturer.module_course_id_3 == nil
        Lecturer.update(@lecturer.id, "module_course_id_3" => @modulecourse.id)
      end
    end
  end
  
  def find_lecturer_link_to_module(module_id)
    @modulecourse = Modulecourse.find_by(id: module_id)
    @flecturers = Lecturer.where("module_course_id_1 = ? OR module_course_id_2 = ? OR module_course_id_3 = ?", module_id, module_id, module_id)
    @flecturer = @flecturers.first unless @flecturers.nil?
    if @flecturer
      @user = User.find_by(id: @flecturer.user_id)
      @user
    else
      nil
    end
  end
end
