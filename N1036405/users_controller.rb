
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
  # 把user這個model實體化放入實體變數user
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  # 把接收到的一包資料放入實體變數@user
  # 然後進行判斷 如果存檔成功,便回到首頁並出現通知成功新增
  # 如果存檔失敗 重新render新增頁面
  #render的作用:收集資訊、資料處理、回傳結果
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
  # 一樣判斷是否更新成功,如果更新成功就轉回首頁,並通知
  # 如果失敗就render編輯頁面
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
    # 這段程式碼是負責清洗我們接收到的資料,
    # 我們將收到的user這包資料進行檢查
    # 只接受name,email,password這些參數
    # 若有其餘的則無視
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
