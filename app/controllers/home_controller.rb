class HomeController < ApplicationController
 before_filter :login_required
   
  def index
    #@current_user = User.first

    @flits = current_user.all_flits
    @last_flits = current_user.flits.last
  end

  def delete_flit
    @user = User.find_by_username(params[:username])
    @flits = @user.all_flits
    @flits.destroy
  end

   def last_flit_message
    @last_flit.blank? ? 'No Flits yet.' : @last_flit
  end
  

  # last flit creation time or  placeholder
  #
  def last_flit_created
    @last_flit.blank? ? 'Awaiting first flit.' : (distance_of_time_in_words_to_now(@last_flit.created_at) + ' ago')
  end


def show
  @user = User.find_by_username(params[:username])
  @flits = @user.all_flits
end


 def toggle_follow
    @user = User.find_by_username(params[:username])
    if current_user.is_friend? @user
      flash[:notice] = "You are no longer following @#{@user.username}"
      current_user.remove_friend(@user)
    else
      flash[:notice] = "You are now following @#{@user.username}"
      current_user.add_friend(@user)
    end
    redirect_to user_flits_path(@user.username)
  end

 def toggle_follow_via_ajax
    user = User.find_by_username(params[:username])
    if current_user.is_friend? user
      current_user.remove_friend(user)
    else
      current_user.add_friend(user)
    end
    render :text => user.username
  end

  
  def following
   @friends = current_user.friends 
  end

    
  def remove_friend
    friend = User.find_by_username(params[:username])
    if friend
      current_user.remove_friend(friend)
      render :text => friend.username
    else
      render :text => "None"
    end
  end
  

  def search
    @q =params[:q]
    @friends = User.find_by_search_query(@q)
  end
  
  def destroy
    @flit = Flit.find(params[:id])
    @flit.destroy

    
  end
end
