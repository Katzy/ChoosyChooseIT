class ChooseitsController < ApplicationController

  include ApplicationHelper

  def index
    @author = User.find(params[:user_id])
    @chooseits = @author.chooseits.all
  end

  def new
    if session[:guest_id] != current_user.guest_id
      @author = User.find(params[current_user.id])
      @chooseit = @author.chooseits.new
    else
      @chooseit = Chooseit.new
    end
    # @chooseit_choices = [@chooseit_choice_1 = ChooseitChoice.new, @chooseit_choice_2 = ChooseitChoice.new]

    # redirect_to new_user_chooseit_path(@user)
  end

  def create
    if session[:guest_id] != current_user.guest_id
      @author = User.find(params[current_user.id])
      @chooseit = @author.chooseits.new(chooseit_params)
      @chooseit.author_id = @author.id
    else
      @chooseit = Chooseit.new(chooseit_params)
      @chooseit.author_id = current_user.id
    end
    @chooseit_choice_1 = @chooseit.chooseit_choices[0]
    @chooseit_choice_2 = @chooseit.chooseit_choices[1]


      # @chooseit_choice_1 = .new(chooseit_choice_params)
    # @chooseit_choice_1[:chooseit_id] = @chooseit.id
    # @chooseit_choice_2 = ChooseitChoice.new(chooseit_choice_params)
    # @chooseit_choice_2[:chooseit_id] = @chooseit.id

    respond_to do |format|
      if @chooseit.save
          @chooseit_choice_1.save
          @chooseit_choice_2.save
        # UserMailer.wrestler_added(user).deliver
        format.html { redirect_to chooseit_path(@chooseit), notice: 'ChooseIT was successfully created.' }
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

    @chooseit_choice_1 = @chooseit.chooseit_choices.first
    @chooseit_choice_2 = @chooseit.chooseit_choices.last

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
    params.require(:chooseit).permit(:title, :short_name, :author_id, :genres, :created_at, :updated_at, :user_id, chooseit_choices_attributes: [:description, :chooseit_id, :image])
  end

end
