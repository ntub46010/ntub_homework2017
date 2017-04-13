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
 +  
 +  # GET /users/new  
 +  def new  ＃定義new方法 儲存新的user
 +    @user = User.new
 +  end
 +
 + 
 +  # GET /users/1/edit  #定義edit方法
 +  def edit
 +  end
 +
 +  #定義create方法，把前面的new方法拿來用,存檔成功，到User頁面，出現訊息'User was successfully created.'和顯示欄位與新增的內容，，若存檔失敗重回新增介面
 +  # POST /users
 +  # POST /users.json
 +  def create
 +    @user = User.new(user_params) 
 +
 +    respond_to do |format|
 +      if @user.save
 +        format.html { redirect_to @user, notice: 'User was successfully created.' }
 +        format.json { render :show, status: :created, location: @user }
 +      else
 +        format.html { render :new }
 +        format.json { render json: @user.errors, status: :unprocessable_entity }
 +      end
 +    end
 +  end
 +
 +  #定義update方法，新增User.update的參數，更新成功，到User頁面，出現訊息'User was successfully updated.'和顯示欄位與更新後的欄位內容，，若存檔失敗會重新到新增介面
 +  # PATCH/PUT /users/1
 +  # PATCH/PUT /users/1.json
 +  def update
 +    respond_to do |format|
 +      if @user.update(user_params)
 +        format.html { redirect_to @user, notice: 'User was successfully updated.' }
 +        format.json { render :show, status: :ok, location: @user }
 +      else
 +        format.html { render :edit }
 +        format.json { render json: @user.errors, status: :unprocessable_entity }
 +      end
 +    end
 +  end
 +
 +  # DELETE /users/1
 +  # DELETE /users/1.json
 +  def destroy     ＃定義dstory方法 新增user.desttoy方法.成功刪除會顯示'User was successfully destroyed訊息
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
 +    #過濾欄位，只允許name、email、password這三個欄位的參數通過，其他都會被過濾掉
 +    # Never trust parameters from the scary internet, only allow the white list through.
 +    def user_params
 +      params.require(:user).permit(:name, :email, :password)
 +    end
 +end
