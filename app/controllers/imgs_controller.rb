class ImgsController < ApplicationController

    def show
        @img = Img.find(params[:id])
    end
end
