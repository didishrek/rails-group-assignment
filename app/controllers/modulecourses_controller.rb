class ModulecoursesController < ApplicationController
  def index
    @modulecourses = Modulecourse.all
  end
  
  def addmodtostudent
    addmoduletostudent(params[:id])
    redirect_to modules_path
  end
  
  def withdrawmodulestudent
    withdrawmodule(params[:id])
    redirect_to modules_path
  end
end
