class Ppt::LiveController < ActionController::Base

  def show
    @question=Question.find(params[:id])
  end
end
