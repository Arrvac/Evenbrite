class AttendancesController < ApplicationController
  def new
    @event_id = Event.find(params[:event_id])
    @attendance = Attendance.new
  end

  def create
    @event_id = Event.find(params[:event_id])
    @attendance = Attendance.new(user: current_user, event: @event_id)
    if @attendance.save
      redirect_to @attendance, notice: "Bravo! Youre set to go"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

end
