#設定@user實體變數，並儲存成類別
  def new
    @user = User.new
  end

  
#編輯  
  # GET /users/1/edit
  def edit
  end

  
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
	#若成功儲存，顯示User was successfully created
	#若失敗，顯示錯誤訊息
	
    end
  end
  
#傳過來的資料會被收集在 params 裡，透過 user_params把它丟給 Candidate Model，接著呼叫 save 方法存檔。

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
	  #若編輯存檔成功，將會轉往user列表頁面，若失敗則重新 redner 編輯頁面 
    end
  end

#使用update方法更新資料。
#為了安全考量，如果是直接丟沒有清洗過的 params 給它的話，會發生錯誤訊息。

  
  
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
	
	#對資料進行「清洗」
	#沒有要給外部存取，所以通常會放在 private 區塊。
	#裡面的 permit 方法，只允許 name、email, password這些參數通過，其它會無視
