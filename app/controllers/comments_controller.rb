class CommentsController < ApplicationController
    before_action :authenticate_user!

  def create
    habit =:Habit.find(params[:habit_id])
    comment = habit.comments.build(comment_params) #buildを使い、content:habit_idの二つを同時に代入
    comment.user_id = current_user.id
    if comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    end
  end
end
