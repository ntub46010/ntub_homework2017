def new
    @user = User.new
end
#使用 User 這個 Model 做出一個新的實體，並存為 @user 實體變數供 View 使用

def edit
end
#在 Controller裡把資料抓出來

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
#如果編輯存檔成功，將會轉往user列表頁面，並帶有提示訊息:User was successfully created.，render 顯示頁面；如果存檔失敗，
 將會重新 render 新增頁面。
 
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
#使用update方法更新資料，將會轉往user列表頁面，並帶有提示訊息:User was successfully created.，render 顯示頁面；如果存檔失敗，
 將會重新 render 編輯頁面。

1.整體程式說明：是在新增、編輯、刪除、更新使用者的資料。

2.def user_params
      params.require(:user).permit(:name, :email, :password)
  end
  #清洗欄位，只有name,email,password可以傳入
