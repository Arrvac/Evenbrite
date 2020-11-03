class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :destroy]
  before_action :find_event, only: [:show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show

  end

  def create
    @event = Event.new(events_params)
    @event.user = current_user
    if @event.save
      redirect_to @event, notice: "Bravo! You created a new event"
    else
      render :new
    end
  end

  private

  def events_params
    params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location)
  end

  def find_event
    @event = Event.find(params[:id])
  end

end

