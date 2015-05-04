class ChooseitsController < ApplicationController

  include ApplicationHelper

  before_action :current_user

  def index

    @author = User.find(params[:user_id])
    @chooseits = Chooseit.where("author_id = #{@author.id}")
    p "hello"

  end

  def new
    @chooseit = Chooseit.new

    @chooseit_choice_1 = @chooseit.chooseit_choices.build
    @chooseit_choice_2 = @chooseit.chooseit_choices.build
  end
    # @chooseit_choices = [@chooseit_choice_1 = ChooseitChoice.new, @chooseit_choice_2 = ChooseitChoice.new]

    # redirect_to new_user_chooseit_path(@user)


  def create
    if session[:guest_id] != current_user.guest_id
      @author = User.find(params[current_user.id])
      @chooseit = @author.chooseits.new(chooseit_params)
      @chooseit.author_id = @author.id
    else
      @chooseit = Chooseit.new(chooseit_params)
      @chooseit.author_id = current_user.id
    end

     @chooseit_choice_1 =  @chooseit.chooseit_choices.new(chooseit_params[:chooseit_choices_attributes][0])
     @chooseit_choice_2 =  @chooseit.chooseit_choices.new(chooseit_params[:chooseit_choices_attributes][1])
      # @chooseit_choice_1 = .new(chooseit_choice_params)
    # @chooseit_choice_1[:chooseit_id] = @chooseit.id
    # @chooseit_choice_2 = ChooseitChoice.new(chooseit_choice_params)
    # @chooseit_choice_2[:chooseit_id] = @chooseit.id

    respond_to do |format|
      if @chooseit.save

        # UserMailer.wrestler_added(user).deliver
        format.html { redirect_to chooseit_path(@chooseit), notice: 'ChooseIT was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chooseit }
        # added:
        format.js   { render action: 'show', status: :created, location: @chooseit }
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
    @author = User.find(@chooseit.author_id)
    @chooseit_choice_1 = @chooseit.chooseit_choices[0]
    @chooseit_choice_2 = @chooseit.chooseit_choices[1]

  end

  # GET /users/:id/edit
  def edit
    @chooseit = Chooseit.find(params[:id])
    @chooseit_choices = @chooseit.chooseit_choices
    @chooseit_choice_1 = @chooseit_choices[0]
    @chooseit_choice_2 = @chooseit_choices[2]
    @author = User.find(@chooseit.author_id)

    # authorize! :update, @user
  end

  def update
    @chooseit = Chooseit.find(params[:id])
    @author = User.find(@chooseit.author_id)
    if @chooseit.update(chooseit_params)
      redirect_to user_chooseits_path(@author)
    else
      render :edit
    end
  end

  def destroy


    @chooseit = Chooseit.find(params[:id])
    @chooseit_choices = @chooseit.chooseit_choices
    user = @chooseit[:author_id]
    @chooseit_choices.each do |choice|
      choice.destroy
    end
    @chooseit.destroy
    # UserMailer.wrestler_deleted(user).deliver
    redirect_to user_chooseits_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :guest_id, :uid, :image, :name, :provider)
  end

  def chooseit_params
    params.require(:chooseit).permit(:title, :short_name, :author_id, :genres, :created_at, :updated_at, :user_id, chooseit_choices_attributes: [:id, :description, :chooseit_id, :image, :_destroy])
  end

end
