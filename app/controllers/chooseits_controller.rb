class ChooseitsController < ApplicationController

  include ApplicationHelper

  skip_before_filter :current_or_guest_user, :only => [:index]

  def index
    p params[:user_id]
    @author = User.find(params[:user_id])
    @chooseits_temp = Chooseit.where("user_id = #{@author.id}")
    @chooseits = []
    @chooseits_temp.each do |chooseit|
      @chooseits << chooseit = Chooseit.friendly.find(chooseit.id)
    end
  end

  def new
    if current_user != nil
      @user = current_user
    else
      @user = guest_user
    end
    @chooseit = Chooseit.new
    @chooseits = @user.chooseits
    @chooseit_choice_1 = @chooseit.chooseit_choices.build
    @chooseit_choice_2 = @chooseit.chooseit_choices.build
  end
    # @chooseit_choices = [@chooseit_choice_1 = ChooseitChoice.new, @chooseit_choice_2 = ChooseitChoice.new]

    # redirect_to new_user_chooseit_path(@user)


  def create


    @chooseit = Chooseit.new(chooseit_params)
    @chooseit.user_id = current_or_guest_user.id

    respond_to do |format|
      if @chooseit.save

        UserMailer.new_chooseit(current_or_guest_user).deliver
        format.html { redirect_to chooseit_path(@chooseit), notice: 'ChooseIT was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chooseit }
        # added:
        format.js   { render action: 'show', status: :created, location: @chooseit }
      else
        @chooseit_choice_1 = @chooseit.chooseit_choices.build
        @chooseit_choice_2 = @chooseit.chooseit_choices.build

        format.html { render action: 'new' }

        format.json { render json: @chooseit.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @chooseit.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

    @chooseits = current_or_guest_user.chooseits
    @chooseit = Chooseit.includes(:chooseit_choices).find(params[:id])

    @chooseit_choice_1 = @chooseit.chooseit_choices[0]
    @chooseit_choice_2 = @chooseit.chooseit_choices[1]

  end

  # GET /users/:id/edit
  def edit
    @chooseit = Chooseit.find(params[:id])
    @user = User.find(@chooseit.user_id)
    @chooseits = @user.chooseits
    # authorize! :update, @user
  end

  def update
    @chooseit = Chooseit.find(params[:id])
    @user = User.find(@chooseit.user_id)
    if @chooseit.update(chooseit_params)
      redirect_to user_chooseits_path(@user)
    else
      render :edit
    end
  end

  def destroy


    @chooseit = Chooseit.find(params[:id])
    @chooseit_choices = @chooseit.chooseit_choices
    user = @chooseit[:user_id]
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
