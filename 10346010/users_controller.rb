#1.請幫四個Action的內容加上適當的程式碼註解或說明在做些什麼事

#提交表單後，資料會被打包成User物件
def new
    @user = User.new
end

#編輯某筆User資料，採預設的程式流程(來自父類別)
def edit
end

#在資料庫中新增資料
def create
    #清洗資料
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save   
        #若新增成功，頁面導向至該筆User資料，顯示成功訊息
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        #若新增失敗，回到新增頁面，顯示失敗訊息
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end
 
def update
    respond_to do |format|
      if @user.update(user_params)
        #若更新成功，頁面導向至該筆User資料，顯示成功訊息
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        #若更新失敗，回到修改頁面，顯示失敗訊息
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

#2.請說明user_params方法的用途。

#require用來接收User物件；permit則用來過濾(清洗)，只有name、email、password三個欄位的資料才可被保留
#過濾完成後傳回
def user_params
      params.require(:user).permit(:name, :email, :password)
end
