class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  #定義index要做那些事，會傳user的所有資料給view
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  #定義show要做那些事
  def show
  end

  # GET /users/new
  #定義new要做那些事
  def new
    @user = User.new
  end

  # GET /users/1/edit
  #定義edit要做那些事
  def edit
  end

  # POST /users
  # POST /users.json
  #定義create要做那些事
  #將資料新增到資料庫，如果成功跳轉頁面 @user，不然回到new頁面(表格內的資料還會再)
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  #定義update要做那些事
  #將資料更新到資料庫，如果成功跳轉頁面 @user，不然回到edit頁面(表格內的資料還會再)
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
    #對這包 params 進行「清洗」，允許 name、email 以及 password 這些參數通過
    #因為可能有多個actions會進行「清洗」的動作，所以定義一個方法user_params
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
