class MessagesController < ApplicationController

    def show
        @message = Message.find(params[:id])
        @messages = Message.all.where(event_id: @message.event_id)
    end
    
    def content
        message = Message.find(params[:id])
        string = "#{current_user.name}: " + params[:message][:content]
        content = Message.create(title: message.title, content: string, event_id: message.event_id)
        redirect_to message_path(message)
    end
  end