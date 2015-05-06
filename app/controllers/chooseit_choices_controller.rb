# class ChooseitChoicesController < ApplicationController

#   def new
#     @chooseit_choice_1 = ChooseitChoice.new
#     @chooseit_choice_2 = ChooseitChoice.new
#   end

#   def update
#   end

#   def create
#     if session[:guest_id] != current_user.guest_id
#       @author = User.find(params[current_user.id])
#       @chooseit = @author.chooseits.new(chooseit_params)
#       @chooseit.author_id = @author.id
#     else
#       @chooseit = Chooseit.new(chooseit_params)
#       @chooseit.author_id = current_user.id
#     end
#     @chooseit_choice_1 = ChooseitChoice.new(chooseit_params[:chooseit_choices_attributes][0])
#     @chooseit_choice_2 = ChooseitChoice.new(chooseit_params[:chooseit_choices_attributes][1])


#     respond_to do |format|
#       if @chooseit_choice_1.save
#         if @chooseit_choice_2.save
#       # UserMailer.wrestler_added(user).deliver
#           format.html { redirect_to chooseit_path(@chooseit), notice: 'ChooseIT was successfully created.' }
#           format.json { render action: 'show', status: :created, location: @user }
#           # added:
#           format.js   { render action: 'show', status: :created, location: @user }
#         else
#           format.html { render action: 'new' }
#           format.json { render json: @chooseit_choice_2.errors, status: :unprocessable_entity }
#           # added:
#           format.js   { render json: @chooseit_choice_2.errors, status: :unprocessable_entity }
#         end
#         format.html { redirect_to chooseit_path(@chooseit), notice: 'ChooseIT was successfully created.' }
#         format.json { render action: 'show', status: :created, location: @user }
#         # added:
#         format.js   { render action: 'show', status: :created, location: @user }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @chooseit_choice_1.errors, status: :unprocessable_entity }
#         # added:
#         format.js   { render json: @chooseit_choice_1.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def delete
#   end

#   private

#   def user_params
#     params.require(:user).permit(:email, :password, :password_confirmation, :guest_id, :uid, :image, :name, :provider)
#   end

#   def chooseit_params
#     params.require(:chooseit).permit(:title, :short_name, :author_id, :genres, :created_at, :updated_at, :user_id, chooseit_choices_attributes: [:id, :description, :chooseit_id, :image])
#   end

#   def chooseit_choice_params
#     params.require(:chooseit_choice).permit(:description, :chooseit_id, :image)
#   end

# end
