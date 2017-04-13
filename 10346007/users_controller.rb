  # GET /users/new
  def new #為User表單建立實體變數
    @user = User.new
  end

  # GET /users/1/edit
  def edit #編輯
  end

  # POST /users
  # POST /users.json
  def create #新增資料
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save #存檔成功的話會跳到user頁面，並顯示訊息成功訊息
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else #存檔失敗會重新render新增頁面
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update #更新資料
    respond_to do |format|
      if @user.update(user_params) #更新成功跳到user頁面，並顯示更新成功訊息
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else #更新失敗重新render編輯頁面
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params #規定傳輸的資料只限於name、email、password，其它則會無視
      params.require(:user).permit(:name, :email, :password)
    end
  end
