class MessagesController < ApplicationController

    def show
        @message = Message.find(params[:id])
        @messages = Message.all.where(id: @message.id)
    end
    
    def content
        redirect_to message_path(@message)
    end
  end