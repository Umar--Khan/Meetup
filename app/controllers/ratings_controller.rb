class RatingsController < ApplicationController
  def index
  end

  def show
  end

  def new
    flash[:data] ? @rating = Rating.new(flash[:data]) : @rating = Rating.new
  end

  def create
    user = User.find_by_name(@current_user.name)
    tag = Tag.new(get_params)
    if tag.save
      Usertag.create(user_id:user.id, tag_id:tag.id)
      redirect_to tag_path(tag)
    else
      flash[:errors] = tag.errors.full_messages
      flash[:data] = tag
      redirect_to new_tag_url
    end
  end
end
