class CommentsController < ApplicationController


  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def edit
    @comment = Comment.find_by(topic_id: params[:id])
  end
 
  def update
      @comment = Comment.find_by(id: params[:id])
      if @comment.update(comment_params)
        redirect_to topics_path, success: '編集に成功しました'
      else
        flash.now[:danger] = "編集に失敗しました"
        render :edit
      end
  end
  
  def destroy
    @comment = Comment.find_by(topic_id: params[:id])
    if @comment.destroy
        redirect_to topics_path, success: '削除に成功しました'
    else
        flash.now[:danger] = "削除に失敗しました"
        render :edit
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content,:topic_id)
  end
end
