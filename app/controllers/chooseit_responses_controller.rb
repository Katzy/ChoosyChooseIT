class ChooseitResponsesController < ApplicationController

  def create
    if current_user && params[:chooseit] && params[:chooseit][:id] && params[:chooseit_choice]
      @chooseit = Chooseit.find(params[:chooseit][:id])
      @option = @chooseit.chooseit_choices.find_by_id(params[:chooseit_choice][:id])
      if @option && @chooseit && !current_user.voted_for?(@chooseit)
        @option.chooseit_responses.create({ user_id: current_user.id })
        redirect_to chooseit_path(@chooseit)
      else


      end

    else
      # render js: 'alert(\'Your vote cannot be saved.\');'
    end
    @chooseit = Chooseit.find(params[:chooseit][:id])
    @user = User.find(@chooseit.user_id)
    @chooseits=@user.chooseits# redirect_to "/"
  end

  def show
  end

  private

  def chooseit_response_params
    params.require(:chooseit_response).permit(:created_at, :updated_at, :chooseit_choice_id, :user_id)
  end

  def chooseit_params
    params.require(:chooseit).permit(:title, :short_name, :author_id, :genres, :created_at, :updated_at, :user_id, chooseit_choices_attributes: [:id, :description, :chooseit_id, :image, :_destroy])
  end
end

