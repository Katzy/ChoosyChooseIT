class ChooseitResponsesController < ApplicationController

  include ApplicationHelper

  def create
    if current_user == nil
      @user = guest_user
    else
      @user = current_user
    end
    @chooseits = @user.chooseits

    if @user && params[:chooseit] && params[:chooseit][:id] && params[:chooseit_choice]
      @chooseit = Chooseit.find(params[:chooseit][:id])
      @option = @chooseit.chooseit_choices.find_by_id(params[:chooseit_choice][:id])
      if @option && @chooseit && !@user.voted_for?(@chooseit)
        @option.chooseit_responses.create({ user_id: @user.id })
      end

    respond_to do |format|
      if @option.save
        if current_or_guest_user.voted_for?(@chooseit) && current_or_guest_user.id != @chooseit.user_id


        end
     format.html {redirect_to opined_path }
        # format.html { redirect_to chooseit_path(@chooseit) }

        format.json { render action: 'show', status: :created, location: @chooseit }
        # added:
        format.js   { render action: 'show', status: :created, location: @chooseit }
      else
        @chooseit = Chooseit.find(params[:chooseit][:id])
        format.html { render action: 'show' }
      end
    end
    else
      flash[:notice]="You have to pick one!"
      @chooseit = Chooseit.find(params[:chooseit][:id])
      redirect_to chooseit_path(@chooseit)
    end
  end

  def opined
  end

  private

  def chooseit_response_params
    params.require(:chooseit_response).permit(:created_at, :updated_at, :chooseit_choice_id, :user_id)
  end

  def chooseit_params
    params.require(:chooseit).permit(:title, :short_name, :author_id, :genres, :created_at, :updated_at, :user_id, :emails, chooseit_choices_attributes: [:id, :description, :chooseit_id, :image, :_destroy])
  end
end

