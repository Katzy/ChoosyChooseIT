module Users
  class ChooseitsController < ApplicationController

    def new
      @chooseit = Chooseit.new
    end

    def create
      @user = User.find(params[:user_id])

      @chooseit = Chooseit.new(chooseit_params)


    end

    def delete
    end

    private

    def chooseit_params
      params.require(:chooseit).permit(:title, :short_name, :author_id, :genres, :created_at, :updated_at)
    end
  end
end
