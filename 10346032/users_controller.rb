1

1-1new
  def new
    @user = User.new  #使用 User 這個 Model 做出一個新的實體，並存為 @user 實體變數供 View 使用。
  end
1-2edit
  def edit  #編輯
  end
  1-3
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
  ==begin
  傳過來的資料會被收集在user_params裡，
  呼叫 save 方法準備存檔。如果存檔成功，便轉往候選人列表頁（redirect_to），
  並帶有一提示訊息"User was successfully created."；如果失敗，則重新 render 新增頁面，並顯示錯誤訊息。
  ==end
1-4
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
  ==begin
把清洗過的檔案更新，若編輯存檔成功，將會轉往user頁面，並顯示'User was successfully updated.'，若失敗則重新 redner 編輯頁面。
  ==end
  
  
  
  2.
  
   # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
==begin
清洗工作—只允許 name、mail、 password 這些參數通過，其它會無視
==end
