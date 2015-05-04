module Users
  class ChooseitsController < ApplicationController

    include ApplicationHelper

    before_action :current_user

    def index

    @author = User.find(params[:user_id])
    @chooseits = Chooseit.where("'author_id' = #{@author.id}")

    end

    def new
      @author = User.find(params[:user_id])
      @chooseit = @user.chooseits.new
    end

    # def create
    #   @author = User.find_by(params[:user_id])
    #   p "author id #{@author.id}"
    #   @chooseit = @author.chooseits.new(chooseit_params)
    #   @chooseit.author_id = @author.id
    #   respond_to do |format|
    #     if @chooseit.save
    #       # UserMailer.wrestler_added(user).deliver
    #       format.html { redirect_to user_chooseits_path(@author), notice: 'ChooseIT was successfully created.' }
    #       format.json { render action: 'show', status: :created, location: @author }
    #       # added:
    #       format.js   { render action: 'show', status: :created, location: @author }
    #     else
    #       format.html { render action: 'new' }
    #       format.json { render json: @chooseit.errors, status: :unprocessable_entity }
    #       # added:
    #       format.js   { render json: @chooseit.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    def show
      # authorize! :read, @user
    end

    # GET /users/:id/edit
    def edit
      # authorize! :update, @user
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :guest_id, :uid, :image, :name, :provider)
    end

    def chooseit_params
      params.require(:chooseit).permit(:title, :short_name, :author_id, :genres, :created_at, :updated_at, :user_id)
    end

    def chooseit_choice_params
      params.require(:chooseit_choice).permit(:description, :chooseit_id, :image)
    end
  end
end