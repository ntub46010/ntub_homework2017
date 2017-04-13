class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
 #在index顯示所有使用者
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end
  #新建使用者

  # GET /users/1/edit
  def edit
  end
  #編輯

  # POST /users
  # POST /users.json
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
   #使用者資料成功儲存後，網頁顯示 "User was successfully created"
   #使用者輸入資料有誤，未成功儲存，回上一頁─新建資料頁面，繼續編輯
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
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
    #使用者資料更新成功後，網頁顯示 "User was successfully updated."
    #使用者資料更新失敗，回編輯頁面繼續編輯
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
      params.require(:user).permit(:name, :email, :password)
    end
end
#清洗使用者傳的params，只允許name、email、password參數通過
