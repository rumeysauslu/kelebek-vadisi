# frozen_string_literal: true

module Admin 
  class SurveysController < AdminController
    before_action :set_survey, only: %i[edit update destroy]
    def index
      @surveys = Survey.all.order(sequence: :desc)
    end

    def new
      @survey = Survey.new
    end

    def create
      @survey = Survey.new(survey_params)
      @survey.save ? redirect_to(admin_surveys_path, notice: 'Yeni soru eklendi') : render(:new)
    end

    def edit;end

    def update
      @survey.update(survey_params) ? redirect_to(admin_surveys_path, notice: 'Soru güncellendi') : render(:edit)
    end

    def destroy
      @survey.destroy ? redirect_to(admin_surveys_path, notice: 'Soru silindi') : redirect_to(admin_surveys_path, notice: 'Soru silinemedi')
    end

    private

    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:question, :sequence)
    end
  end
end
