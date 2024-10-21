class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def reservation_completed_email
        @user = params[:reservation][:name]
        @email = params[:reservation][:email]
        @theater = Theater.find(params[:reservation][:theater_id])
        @movie = Movie.find(params[:reservation][:movie_id])
        @screening_time = Schedule.find(params[:reservation][:schedule_id])
        mail(to: @email, subject: '予約完了通知')
    end

    def reservation_reminder_email(reservation)
        @theater = reservation.theater
        @movie = reservation.movie
        @screening_time = reservation.schedule
        @sheet = reservation.sheet
        @user = reservation.user
        @email = reservation.email

        mail(to: @email, subject: '予約前日のお知らせ')
    end
end