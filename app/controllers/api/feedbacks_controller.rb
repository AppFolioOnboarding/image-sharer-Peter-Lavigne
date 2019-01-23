module Api
  class FeedbacksController < ApplicationController
    def create
      Feedback.create!(params.require(:feedback).permit(:name, :feedback))
      redirect_to new_feedback_url
    end
  end
end
