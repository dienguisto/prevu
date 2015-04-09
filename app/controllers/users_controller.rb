class UsersController < ApplicationController
  before_action :only_for_admins!, only: [:create, :new, :edit, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :can_edit!, only: [:show, :edit, :destroy]

  # GET /users
  # GET /users.json
  def index
    if current_user.user_system?
      @users = User.order(:id).page params[:page]
    else
      @users = current_user.entite.users.order(:id).page params[:page]
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.creator = current_user
    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password

    respond_to do |format|
      if @user.save
        UserMailer.welcome(@user.email, generated_password).deliver_later
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :role, :entite_id)
    end

    def can_edit!
      unless current_user.user_system? or current_user.entite == @user.entite
        flash[:error] = 'Vous ne pouvez pas faire ce traitement'
        redirect_to root_path
      end
    end
end
