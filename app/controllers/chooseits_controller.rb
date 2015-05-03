class ChooseitsController < ApplicationController

  include ApplicationHelper

  def index
    @author = User.find(params[:user_id])
    @chooseits = @author.chooseits.all
  end

  def new
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(current_user.id)
    end
    @chooseit = @user.chooseits.new
    # redirect_to new_user_chooseit_path(@user)
  end

  def create
    if params[:user_id]
      @author = User.find(params[:user_id])
    else
      @author = User.find(current_user.id)
    end

    @chooseit = @author.chooseits.new(chooseit_params)
    @chooseit.author_id = @author.id

    respond_to do |format|
      if @chooseit.save
        # UserMailer.wrestler_added(user).deliver
        format.html { redirect_to user_chooseits_path(@author), notice: 'ChooseIT was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
        # added:
        format.js   { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @chooseit.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @chooseit.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @chooseit = Chooseit.find(params[:id])
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

   def destroy


      @chooseit = Chooseit.find(params[:id])
      user = @chooseit[:author_id]
      @chooseit.destroy
      # UserMailer.wrestler_deleted(user).deliver
      redirect_to user_chooseits_path(user)
    end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :guest_id, :uid, :image, :name, :provider)
  end

  def chooseit_params
    params.require(:chooseit).permit(:title, :short_name, :author_id, :genres, :created_at, :updated_at, :user_id)
  end
end
