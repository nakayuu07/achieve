class CommentsController < ApplicationController
  def create
      # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
      @comment = current_user.comments.build(comment_params)
      @blog = @comment.blog

      # クライアント要求に応じてフォーマットを変更
        respond_to do |format|
       if @comment.save
         format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
         # JS形式でレスポンスを返します。
         format.js { render :index } # comments_areaの部分だけ部分的に描画する処理が書かれている
       else
         format.html { render :new }
       end
       end
   end

   def destroy
     @comment = Comment.find(params[:id])
     @blog = @comment.blog
     @comment.destroy
     respond_to do |format|
     format.html { redirect_to blog_path(@blog), notice: 'コメントを削除しました。' }
     format.js { render :index }
   end
   end


    private
      # ストロングパラメーター
      def comment_params
        params.require(:comment).permit(:blog_id, :content)
      end
end
