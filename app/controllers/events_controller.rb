class EventsController < ApplicationController
  before_action :logged_in?, :only => :new

  def new
    @event = current_user.created_events.build
  end

  def index
    @events = Event.all.order("created_at ASC")
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:notice] = "Event was successfully created."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to current_user
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :date, :creator_id, :creator)
  end
end
