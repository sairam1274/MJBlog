class FlitsController < ApplicationController
  before_filter :login_required
  
  def like
    @flit = Flit.find(params[:id])
    if @current_user.flagged?(@flit, :like)
      @current_user.unflag(@flit, :like)
      msg= "you dont like this flit"
    else
      @current_user.flag(@flit, :like)
      msg= "you now like this flit"
    end
      redirect_to root_path, :notice => msg
  end
  
  def index
    @flits = current_user.all_flits
    @last_flits = current_user.flits.last
    @flit = Flit.new
  end
  
  
  def create
    @flit = current_user.flits.build(params[:flit])
    @flit.created_at = Time.now # HACK
    @flit.save!
    redirect_to root_path
  end

  def destroy
    @flit = Flit.find(params[:id])
    @flit.delete
    redirect_to root_path
  end
  
  def show
    @flit = Flit.includes(:comments).find(params[:id])
  end
 
 

end













