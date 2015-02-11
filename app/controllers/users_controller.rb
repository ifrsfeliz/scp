class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    # @users = User.where.not(:id => current_user.id)
    @users = User.all
  end

  def new
    redirect_to users_path, notice: 'Não é possível criar usuários manualmente.'
  end

  def create
    redirect_to users_path, notice: 'Não é possível criar usuários manualmente.'
  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(user_params)
      puts @user
      
      flash[:notice] = "Usuário atualizado com Sucesso."
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Usuário deletado com sucesso."
      redirect_to users_path
    end
  end

  private
  def user_params
    puts params
    params.require(:user).permit(:admin_authorization, {:role_ids => []})
  end
end
