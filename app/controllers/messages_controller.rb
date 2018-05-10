class MessagesController < ApplicationController
    def index
        render 'index'
    end

    def create
        @message = Message.new(post:params[:post], user_id:session[:id])
        @message.save
        if @message.save
            flash[:message] = "#{@message.post}"
            redirect_to "/messages"
        else
            flash[:errors] = "Post is too short"
            redirect_to '/messages'
        end
    end
    
    def show 
        render 'index'
    end

    
end
