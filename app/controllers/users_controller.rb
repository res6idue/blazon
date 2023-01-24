class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.where.not(id: current_user.id)
    @users.each do |user|
      user.following = !Relationship.where(user_id: user.id, follower_id: current_user.id).empty?
      user.followers = Relationship.where(user_id: user.id).length
      user.followings = Relationship.where(follower_id: user.id).length
    end
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @user.following = !Relationship.where(user_id: @user.id, follower_id: current_user.id).empty?
    @user.followers = Relationship.where(user_id: @user.id).length
    @user.followings = Relationship.where(follower_id: @user.id).length
    @user.blazos = Blazo.where(user: @user).order(created_at: :desc)
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def follow
    @user = User.find(params[:id])
    @following = Relationship.where(user_id: @user.id, follower_id: current_user.id)
    if !@following.empty?
      Relationship.destroy(@following[0].id)
    else
      Relationship.create(user_id: @user.id, follower_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end
    
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :bio)
    end
end
