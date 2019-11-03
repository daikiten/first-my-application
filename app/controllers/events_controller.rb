class EventsController < ApplicationController
  def index
    @events = Event.all
  end

 
  def show
   @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = now_user.events.build(event_check)
    if @event.save
      flash[:success] = 'イベントを登録しました。'
      redirect_to events_path
    else
      flash.now[:danger] = 'イベントの登録に失敗しました。'
      render :new
    end
  end
  
   def edit
    @event = Event.find(params[:id])
   end
  
  def update
    @event = Event.find(params[:id])
    
    if @event.update(event_check)
      flash[:success] = 'イベント情報を更新しました。'
      redirect_to root_path
    else 
      flash.now[:danger] = 'イベント情報を更新できませんでした。'
      render :edit
    end
  end

  
  def search
    keyword = params[:place]
    if params[:place].present?
      @events = Event.where("place LIKE ?", "%" + keyword + "%" )
    else
      @events = Event.none
    end
  end
  #place :keywordはダブルクォーテーションでやる必要がない。なぜなら変数だから。
  
  private
  
  def event_check
   params.require(:event).permit(:name, :place, :date, :hour, :minimum_people, :material, :comment, :photo)
  end
end
