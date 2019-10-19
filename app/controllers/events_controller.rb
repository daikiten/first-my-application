class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def edit
    
  end

  def show
    @event = Event.find(id: [:params])
  end

  def new
    @events = Event.new
  end

  def create
    @events = current_user.events.build(event_secure)
    if @events.save
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
