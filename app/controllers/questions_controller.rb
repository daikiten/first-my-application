class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_check)
    if @question.save
      flash[:success] = 'お問い合わせを受け付けました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'お問い合わせを受け付けませんでした。'
      render :new
    end
  end
  
  private
  
  def question_check
   params.require(:question).permit(:content, :email)
  end
end
