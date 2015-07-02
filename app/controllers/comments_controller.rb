class CommentsController < ApplicationController
  def ajax_add_comment
    comment = Comment.new(comment_params)
    if comment.save
      respond_to do | wants |
        wants.html {render partial: "comments/comments", locals: {comment: comment} }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :job_id)
  end
end
