class EventsController < ApplicationController
  def new
    if @current_user
      @event = Event.new
      @event.tags.build
      @event.groups.build
      @event.messages.build
      @event.places.build
    else
      flash[:notice] = "Please sign in to continue!"
      redirect_to "/login"
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      flash[:errors] = @event.errors.full_messages
      flash[:data] = @event
      redirect_to "/events/new"
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to edit_event_path(@event)
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_path(@current_user)
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @places = Place.find_by(event_id: @event.id)
    @groups = Group.find_by(event_id: @event.id)
    @message = Message.find_by(event_id: @event.id)
  end

  def attend
    @event = Event.find(params[:id])
    @group = Group.new(user_id: @current_user.id, event_id: @event.id, number: 0) 
    if @group.save  
      redirect_to event_path(@event)
    else
      flash[:errors] = @group.errors.full_messages
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name, 
      :time, 
      :loc, 
      tags_attributes: [:main_tag],
      messages_attributes: [:event_id, :title, :content],
      places_attributes: [:name, :latitude, :longitude, :event_id],
      groups_attributes: [:event_id, :user_id, :number]
      )
  end
end