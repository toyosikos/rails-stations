module Admin
    class ReservationsController < ApplicationController
        def index
            @reservations = Reservation.all
        end
        def new
            @reservation_new = Reservation.new
            @sheets = Sheet.all
            @movies = Movie.all
            @schedules = Schedule.all
        end
    end


end