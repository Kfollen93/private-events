class EventsController < ApplicationController
    def new
        @event = current_user.created_events.build
    end

    def index
        @events = Event.all.order("created_at DESC")
    end

    def create
        @event = current_user.events.build(event_params)

        if @event.save
            flash[:notice] = "Event was successfully created."
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    private

    def event_params
        params.require(:event).permit(:title)
    end
end
