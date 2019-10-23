class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def edit
    
  end

  def show
   @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_secure)
    if @event.save
      flash[:success] = 'イベントを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'イベントの登録に失敗しました。'
      redirect_back create
    end
  end
  
  def search
  end
end
