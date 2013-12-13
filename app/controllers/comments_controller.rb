class CommentsController < InheritedResources::Base

  
 
  def create
    @flit = Flit.find(params[:flit_id]) 
    @comment = @flit.comments.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
       redirect_to @flit
    else
       render 'new'
  end
end

   # def destroy
    #      @flit = Flit.find(params[:flit_id])
    # @comment = Comment.find(params[:id])
    # @comment.delete
#     @comment = Comment.find(params[:id])
#     @flit = @comment.flit
#      if @flit.user_id == current_user.id
#         @comment.delete
#         redirect_to root_path
#     else
#       flash[:error] = "You don't have permission to delete this comments"
#     end
# end
  
#  end



  # def destroy
  #      @flit = Flit.find(params[:flit_id])
  #     if current_user.id
  #         @comment = Comment.find(params[:id])
  #         @comment.delete
  #         redirect_to root_path
  #     else
  #       @comment = current_user.comments.find(params[:id])

  #     end

  # end




  def destroy
      @flit = Flit.find(params[:flit_id])
      @comment = @flit.comments.find(params[:id])
        if @comment.user_id == current_user.id 
            @comment.delete
            flash[:notice] = "comment deleted!"
        else 
           flash[:error] = "not allowed"
        end
    redirect_to :back
end
end

