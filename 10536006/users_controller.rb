def show  #這個方法是取得要秀出的資料
  end

  def new
    @user = User.new  #宣告一個新的User物件
  end


  def edit  #這個方法是取得編輯的資料
  end

  def create  
    @user = User.new(user_params)  #定義新增方法，其中只會傳入被清洗過的欄位

    respond_to do |format|
      if @user.save 
        format.html { redirect_to @user, notice: 'User was successfully created.' }  #若產生新的檔儲存成功，會有提示字'User was successfully created.'
        format.json { render :show, status: :created, location: @user }  #並會導向show方法,狀態為'已新增',儲存在@user實例變數裡
      else
        format.html { render :new }  #若產生新的檔儲存失敗,導向new方法
        format.json { render json: @user.errors, status: :unprocessable_entity }  #導向失敗的回傳
      end
    end
  end
  
  

  def update
    respond_to do |format|
      if @user.update(user_params)  
        format.html { redirect_to @user, notice: 'User was successfully updated.' }  #若檔案更新成功，會有提示字'User was successfully updated.'
        format.json { render :show, status: :ok, location: @user }  #並會導向show方法,狀態為'ok',儲存在@user實例變數裡
      else
        format.html { render :edit }  #若檔案更新失敗，導向edit方法
        format.json { render json: @user.errors, status: :unprocessable_entity }  #導向失敗的回傳
      end
    end
  end


 def user_params  #清洗欄位，只允許name,email,password三個欄位被傳入
      params.require(:user).permit(:name, :email, :password)
    end
