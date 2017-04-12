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
    @user = User.new
  end
  #定義一個User類別建立user實體

  # GET /users/1/edit
  def edit
  end
  #修改編輯

  # POST /users
  # POST /users.json
  def create  #把資料放入user實體
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save  #當儲存成功回到user頁面回傳給view顯示User was successfully created.
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else           #若失敗則回到render 新增頁面
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update  #先將資料作清洗 更新資料
    respond_to do |format|
      if @user.update(user_params) #若資料更新成功回到user頁面 顯示User was successfully updated.
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else                         #若失敗則回到render 新增頁面
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
    def user_params  #清洗欄位 只允許name、email、password欄位才可以傳入。
      params.require(:user).permit(:name, :email, :password)
    end
end
