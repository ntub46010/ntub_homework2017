  def index  #讓action去找app/views裡面的index.html.erb(避免把html寫在controller裡面)
  end
  
  def new    #使用user model做出一個新的實體，存成@user實體變數給view使用
    @user = User.new
  end
  
  def edit   #編輯修改資料
  end
  
  def create  #新增
    @user = User.new(user_params) #透過user_params把資料丟給user model
    
    respond_to do |format|
      if @user.save            #如果儲存成功，則顯示：User was successfully created.並且到候選人的列表頁面
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else                     #如果儲存失敗，顯示錯誤訊息並回到新增頁面
       format.html { render :new } 
       format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
   def update  #更新
    respond_to do |format|
      if @user.update(user_params)   #如果更新成功，則顯示：User was successfully update.並且到候選人的列表頁面
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else                           #如果更新失敗，顯示錯誤訊息並回到更新頁面
       format.html { render :edit }
       format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def candidate_params #清洗：只讓name、email、password參數被塞進user model，避免太多資料塞進去造成安全上的問題
    params.require("user"),permit(:name,:email,:password)
  end
  
