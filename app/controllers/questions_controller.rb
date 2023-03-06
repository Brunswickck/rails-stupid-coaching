class QuestionsController < ApplicationController
  def ask
  end

  def answer
    if params[:question]
      @coach_answer = coach_answer_enhanced(params[:question])
    end
  end

  private

  def coach_answer(your_message)
    if your_message.downcase == 'i am going to work right now!'
      return ''
    elsif your_message.end_with?('?')
      return 'Silly question, get dressed and go to work!'
    else
      return 'I don\'t care, get dressed and go to work!'
    end
  end

  def coach_answer_enhanced(your_message)
    if your_message.downcase == 'i am going to work right now!'
      return ''
    elsif your_message.end_with?('?') && your_message.upcase == your_message
      return 'I can feel your motivation! Silly question, get dressed and go to work!'
    elsif your_message == your_message.upcase
      return 'I can feel your motivation! I don\'t care, get dressed and go to work!'
    else
      coach_answer(your_message)
    end
  end
end
