
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
  # 做出一個新的 User 實體並存為 @user 讓View能使用 
  
  # @user = User.new

  # GET /users/1/edit
  def edit
  end
  # 編輯

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
  # 傳回來的資料會收集在 user_params 裡，並將他指派給 @user 
  # 呼叫 save 這個方法
  # 當新增成功會回到 user 頁面，並回傳給view 顯示 'User was successfully created'
  # 失敗則會 render 新增頁面，並將錯誤訊息顯示出來
  
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
  # 先將資料做清洗
  # 呼叫 update 方法
  # 當更新成功會回到 user 頁面，並回傳給view 顯示 'User was successfully created' 
  # 更新失敗則會 render 編輯頁面，並將錯誤訊息顯示出來

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
     # 限制前端欄位傳到後端，此處只允許 name , email , password。
    
end

