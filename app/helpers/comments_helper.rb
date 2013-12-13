module CommentsHelper

def check_destroy_comment_authority(comment)
    if current_user.id == comment.user_id || current_user.id == comment.flit.user_id
      return link_to 'Delete', [comment.flit, comment], :method => :delete, :class => "btn btn-link"
    end
  end
	
end
