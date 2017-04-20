class ModulecoursesController < ApplicationController
  def index
    @modulecourses = Modulecourse.all
  end
end
