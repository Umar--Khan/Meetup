class EventsController < ApplicationController
  def new
    if @current_user
      @event = Event.new
      @event.imgs.build
      @event.tags.build
      @event.groups.build
    else
      flash[:notice] = "Please sign in to continue!"
      redirect_to "/login"
    end
  end

  def create
    @event = Event.create(event_params)
    @message = Message.create(event_id: @event.id, title: @event.name)
    redirect_to event_path(@event)
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
    redirect_to events_path
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @imgs = Img.find_by(event_id: @event.id)
    @groups = Group.find_by(event_id: @event.id)
    @messages = Message.find_by(event_id: @event.id)
  end

  private

  def event_params
    params.require(:event).permit(
      :name, 
      :time, 
      :loc, 
      imgs_attributes: [:url],
      tags_attributes: [:event_id, :user_id, :main_tag, :sub_tag_01, :sub_tag_02],
      groups_attributes: [:event_id, :user_id, :number]
      )
  end
end

# params.require(:person).permit(contact: [ :email, :phone ])