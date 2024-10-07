class SchedulesController < ApplicationController
    def show
        @schedules = Schedule.find(params[:id])
    end
end