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
  def new               #用以切換到使用者新增的畫面
    @user = User.new    #參考User類別建立一個user實體變數，可用來顯示表格
  end

  # GET /users/1/edit
  def edit              #修改曾經建立過的資料
  end                   

  # POST /users
  # POST /users.json
  def create                        #new網頁底下的Create User按鈕會使用到
                                    #建立資料時所使用到的方法
                                    #資料以流水號方式建立，第一筆為1.json 第二筆為2.json
    @user = User.new(user_params)   #以user_params方法，偵測輸入的資料是否符合規定
                        
    respond_to do |format|          #輸入正確則顯示User was successfully created訊息
                                    #並顯示剛才所建立的資料
                                    #錯誤則顯示錯誤訊息
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
  def update                        #用以修改曾經建立過的資料
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
    def user_params      #偵測輸入的資料是否為user型別，參數是否只有:name, :email, :password三個
      params.require(:user).permit(:name, :email, :password)
    end
end
