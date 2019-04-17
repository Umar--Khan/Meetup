class TagsController < ApplicationController

  def new
    flash[:data] ? @tag = Tag.new(flash[:data]) : @tag = Tag.new
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

  def update
    tag = Tag.find(params[:id])
    if tag.update(get_params)
      redirect_to tag_path tag
    else
      flash[:errors] = tag.errors.full_messages
      redirect_to tags_edit
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def destroy
    Tag.find(params[:id]).delete
    redirect_to tags_path
  end

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @users = @tag.users
  end

  private

  def get_params
    params.require(:tag).permit(:main_tag)
  end

end