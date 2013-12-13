module FlitsHelper
	def toggle_like_button(flit,user)
		if user.flagged?(flit, :like)
			link_to "Unlike", like_flit_path(flit)
		else	
			link_to "Like" , like_flit_path(flit)
		end	
	end


end
