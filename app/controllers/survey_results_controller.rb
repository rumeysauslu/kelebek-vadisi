# frozen_string_literal: true

class SurveyResultsController < ApplicationController
  def new
    @questions = Survey.all.order(sequence: :asc)
    @options = SurveyResult.options
    @result = SurveyResult.new
  end

  def create
    pry
    params[:answer].each do |survey, answers| 
      o = SurveyResult.new(parent_id: 1, survey_id: survey.to_i)
      answers.each {|k, v| o.answers[k.to_i] = v}
      o.save
    end
    redirect_to new_survey_result_path, notice: 'Tamamladınız.'
  end

  private

  def survey_form
    params.require(:survey_result).permit(:answers, :parent_id, :survey_id)
  end
end
