class EventsController < ApplicationController
  def new
    byebug
    # @user = User.find(params[:id])
    @event = Event.new
    # @event.imgs.build
    @event.tags.build
  end

  def create
    @event = Event.create(event_params)
    # byebug
    redirect_to event_path(@event)
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(
      :name, 
      :time, 
      :loc, 
      # imgs_attributes: [:url],
      tags_attributes: [:main_tag]
      )
  end
end

# params.require(:person).permit(contact: [ :email, :phone ])