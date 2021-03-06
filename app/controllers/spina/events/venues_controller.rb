module Spina::Events
  class VenuesController < ApplicationController

    before_action :find_conference

    def show
      @venue = @conference.venue
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    private

    def find_conference
      @conference = Spina::Events::Conference.friendly.find(params[:conference_id])
    end
  end
end
