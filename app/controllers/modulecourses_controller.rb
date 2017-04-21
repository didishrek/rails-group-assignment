class ModulecoursesController < ApplicationController
  def index
    @modulecourses = Modulecourse.all
    @lecturers = User.where(:type_user => "lecturer")
  end
  
  def addmodtostudent
    addmoduletostudent(params[:id])
    redirect_to modules_path
  end
  
  def withdrawmodulestudent
    withdrawmodule(params[:id])
    redirect_to modules_path
  end
  
  def addmodtolecturer
    addmoduletolecturer(params[:module_id], params[:lecturer])
    redirect_to modules_path
  end
end
