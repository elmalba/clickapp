class Ppt::LiveController < ActionController::Base

  def show
    @question=Question.last
  end
end
