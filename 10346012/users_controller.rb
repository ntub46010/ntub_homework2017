

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  # 這裡的index是要取得 view 中的index.html.erb 的資料
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  # 這邊show是要取得點選的user的資料 他會去找user/的資料 並透過show actiont 出來
  def show
  end

  # GET /users/new
  # 這裡new的動作是取得新增的user資料的值
  def new
    @user = User.new
  end

  # GET /users/1/edit
  # 這裡edit是取得所修改的user資料
  def edit
  end

  # POST /users
  # POST /users.json
  # 他會將new中的user資料包裝並create資料庫
  def create
    @user = User.new(user_params) # 去確認傳進資料庫的值

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
  # update 資料庫更新user的判斷
  def update 
    respond_to do |format|
      if @user.update(user_params) # 檢查更新的user值
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else 
        format.html { render :edit } # update 資料庫失敗的回傳
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # destroy資料庫user的資料
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private # 將param成為可以被用的方法 只需要呼叫
    # Use callbacks to share common setup or constraints between actions.
    def set_user 
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params # 這裡是判斷的方法，只准許name email password 修改的資料允許傳送
      params.require(:user).permit(:name, :email, :password)
    end
end
