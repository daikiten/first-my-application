class RelationshipsController < ApplicationController
  
  def create
    user = now_user
    event = Event.find(params[:event_id])
    user.join(event)
    flash[:success] = '参加登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = now_user
    event = Event.find(params[:event_id])
    user.nojoin(event)
    flash[:danger] = '参加をキャンセルしました'
    redirect_back(fallback_location: root_path)
  end
end

#ここに参加登録のメソッドを追加する
#ここの定義はコンソールで確認したので完璧