class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new  # 準備一個空的 User Model
  end

  # GET /users/1/edit
  def edit
    # 透過 `set_user` 找到要編輯的 user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)  # 以清洗過的參數產生一個新的 User Model

    # 根據請求的 url 、成功與否決定回覆怎麼樣的資料型態（json or html）
    respond_to do |format|
      if @user.save  # 儲存 user 物件
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
  def update
    # 透過 `set_user` 找到要編輯的 user
    # 根據請求的 url 、成功與否決定回覆怎麼樣的資料型態（json or html）
    respond_to do |format|
      if @user.update(user_params)  # 以清洗過的參數更新要編輯的 user
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
    def user_params
      # 從 http request 的 body 中挑選出我們所需要的參數
      params.require(:user).permit(:name, :email, :password)
    end
end
