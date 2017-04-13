class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  #設定@user實體變數，並儲存成類別
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

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  
#按下新增按鈕後路徑使POST 的方法，Route 會去找 #create，然後傳過來的那包資料會被收集在 params 裡，所以透過 user_params 把它丟給 Candidate Model，接著呼叫 save 方法準備存檔，成功後顯示User was successfully created.，並寫入，網頁上就會新增該筆資料。
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
  
  #按下修改按鈕後路徑使POST 的方法，Route 會去找 #edit，判斷該筆資料是否修改，成功後顯示User was successfully updated.，並修改，網頁上就會顯示剛剛修改的資料。
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
  
  #按下刪除鈕後路徑使POST 的方法Route 會去找 #destroy，刪除後顯示"User was successfully destroyed."，網頁上剛剛所刪除的資料就會消失
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
    
    #permit 方法只允許 name、email, password 這些參數通過，並清洗。
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
