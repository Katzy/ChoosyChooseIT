class ChooseitsController < ApplicationController

  def new
    @chooseit = Chooseit.new
  end

  def create
    @chooseit = Chooseit.create(chooseit_params)
  end

  def delete
  end

  private

  def chooseit_params
    params.require(:chooseit).permit(:title, :short_name)
  end
end


