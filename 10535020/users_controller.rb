   
  def new
    @user = User.new   建立User表單
  end

  # GET /users/1/edit
  def edit 編輯
  end

  # POST /users
  # POST /users.json
  def create 
    @user = User.new(user_params) 產生新的一筆資料
    respond_to do |format| 
      if @user.save 如果儲存一筆資料成功
        format.html { redirect_to @user, notice: 'User was successfully created.' } 資料連接到@user,notice顯示User was successfully created.
        format.json { render :show, status: :created, location: @user }  傳送show，狀態為創建，位置在user
      else  儲存失敗
        format.html { render :new }  
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update 更新資料
    respond_to do |format| 
      if @user.update(user_params) 如果更新完成，顯示User was successfully updated.
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else 更新失敗
        format.html { render :edit } 跳至編輯狀態
        format.json { render json: @user.errors, status: :unprocessable_entity } 顯示存取失敗
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  

  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_user 用id設定成user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params 清除多餘欄位，以防駭客更改資料庫欄位
      params.require(:user).permit(:name, :email, :password)
    end
end
