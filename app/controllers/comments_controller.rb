class CommentsController < ApplicationController
	before_action :set_man
  
  def new
  	@comment = Comment.new
    @ask.user_id = current_user.id
  end

  def create
  	@comment = Comment.new(comment_params)
  	@comment.man = @man
  	#or @comment = @man.comments.build(comment_params)

  	@comment.save
  	redirect_to man_path(@comment.man)
  end

private 

	def set_man
		@man = Man.find(params[:man_id])
	end

	def comment_params
		params.require(:comment).permit(:content)
	end

end

