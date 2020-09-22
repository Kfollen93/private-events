class AttendingsController < ApplicationController
  def create
    event = Event.find_by_id(params[:event_id])
    user = User.find_by_id(params[:user_id])
    attending = event.attendings.create(user) 
  end
end