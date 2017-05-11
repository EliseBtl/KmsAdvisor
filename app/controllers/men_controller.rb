class MenController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    if params[:tag]
      @men= Man.tagged_with(params[:tag])
    else
      @men = Man.search(params[:search])
    end
    @men = @men.order(created_at: :desc).paginate(page:params[:page], per_page: 20 )
  end

  def new
    @man = Man.new
  end

  def create
    #@man = Man.new(man_params)
    @man = current_user.men.build(man_params)
    if @man.save
      flash[:success] = "Cool tu as noté ton ex 👍 😈 !"
      redirect_to man_path(@man)
    else
      render 'static_pages/home'
    end
  end

  def show
    @man = Man.find(params[:id])
    @comment = Comment.new
    @comment.man_id = @man.id
  end

  def edit
    @man = Man.find(params[:id])
  end

  def update
     @man = Man.find(params[:id])
    if @man.update_attributes(man_params)
      flash[:success] = "Keum updated"
      redirect_to man_path(@man)
    else
      render 'edit'
    end
  end

  def destroy
    @man.destroy
    flash[:success] = "La fiche a été supprimé 😭"
    redirect_to root_url
  end

private 

	def man_params
		params.require(:man).permit(:name, :description)
	end

   # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end



