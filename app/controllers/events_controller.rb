class EventsController < ApplicationController
  def new
    @event = Event.new
    @event.imgs.build
  end

  def create
    @event = Event.create(get_params)
    byebug
    redirect_to event_path(@event)
  end

  def update
    @event = Event.find(params[:id])
    @event.update(get_params)
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

  def get_params
    params.require(:event).permit(
      :name, 
      :time, 
      :loc, 
      imgs_attributes: [
        :url
      ])
  end
end

# params.require(:person).permit(contact: [ :email, :phone ])