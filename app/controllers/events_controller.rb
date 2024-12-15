class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.includes(:creator).all
  end

  def new
    @event = Event.new
  end
  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Your event was updated"
    else
      render :edit
    end
  end
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end
  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to events_path
    else
      flash.now[:error] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end


  def event_attendances
    @event = Event.find(params[:id])
    unless @event.attendees.include?(current_user)
      @event.attendees << current_user
      if @event.save
        flash[:success] = 'Post successfully created'
        redirect_to @event, notice: "You have successfully joined the event."
      else
        redirect_to @event, alert: "Something went wrong. Try again."
      end
    else
      redirect_to @event, notice: "You are already on the list."
    end
  end

  def cancel_event_attendances
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: "You are no longer attending this event"
  end

  private


    def event_params
      params.require(:event).permit(:title, :description,:date_time)
    end
end