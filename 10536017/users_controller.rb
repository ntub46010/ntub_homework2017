+class UsersController < ApplicationController
 +  before_action :set_user, only: [:show, :edit, :update, :destroy]
 +
 +  # GET /users
 +  # GET /users.json
 +  def index
 +    @users = User.all
 +  end
 +
 +  # GET /users/1
 +  # GET /users/1.json
 +  def show
 +  end
 +
 +  # GET /users/new
 +  def new    #建立一個新的users表單
 +    @user = User.new
 +  end
 +
 +  # GET /users/1/edit
 +  def edit   #users表單可編輯
 +  end
 +
 +  # POST /users
 +  # POST /users.json
 +  def create  
 +    @user = User.new(user_params)  #在users表單內，新增一筆資料
 +
 +    respond_to do |format|
 +      if @user.save  #如果此筆資料建立成功
 +        format.html { redirect_to @user, notice: 'User was successfully created.' } 
            #會將此資料傳送至@user, otice，並顯示『User was successfully created』
 +        format.json { render :show, status: :created, location: @user }
            #並跳轉至show頁面，顯示新增資料
 +      else  #如果此筆資料新增失敗
 +        format.html { render :new } #則跳轉至new頁面，請使用者再次新增
 +        format.json { render json: @user.errors, status: :unprocessable_entity }
 +      end
 +    end
 +  end
 +
 +  # PATCH/PUT /users/1
 +  # PATCH/PUT /users/1.json
 +  def update  #更新資料
 +    respond_to do |format|
 +      if @user.update(user_params)  #如果資料更新成功
 +        format.html { redirect_to @user, notice: 'User was successfully updated.' }
           #則顯示『User was successfully updated.』訊息
 +        format.json { render :show, status: :ok, location: @user }
           #並跳轉至Show畫面，顯示更新資料
 +      else  #如果更新失敗
 +        format.html { render :edit } #則跳轉到edit畫面，請使用者再次編輯
 +        format.json { render json: @user.errors, status: :unprocessable_entity }
 +      end
 +    end
 +  end
 +
 +  # DELETE /users/1
 +  # DELETE /users/1.json
 +  def destroy  
 +    @user.destroy
 +    respond_to do |format|
 +      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
 +      format.json { head :no_content }
 +    end
 +  end
 +
 +  private
 +    # Use callbacks to share common setup or constraints between actions.
 +    def set_user
 +      @user = User.find(params[:id])
 +    end
 +
 +    # Never trust parameters from the scary internet, only allow the white list through.
 +  def user_params  #將欄位資料清除
 +      params.require(:user).permit(:name, :email, :password) #只儲存name, email, password欄位資料
 +    end
 +end
 +
