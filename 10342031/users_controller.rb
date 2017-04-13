# 作業 007

請使用 Rails 內建的 Scaffold：
    rails generate scaffold User name:string email:string password:string
產生相關檔案。

1. 請幫 `app/controllers/users_controller.rb` 的 `new`、`create`、`edit` 以及 `update` 等四個 Action 的內容加上適當的程式碼註解或說明在做些什麼事。
整體是在新增、編輯、更新資料

def new
    @user = User.new #@user為User類別
end

def edit
end
#從Controller裡抓資料

def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save   #如果儲存成功，會到@user並顯示'User was successfully created.'
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else  #如果失敗，會到編輯頁面
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end
 
def update 
    respond_to do |format| #更新資料
      if @user.update(user_params)  #如果成功，會到@user並顯示'User was successfully updated.'
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit } #如果失敗，會到編輯頁面
        format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

2. 請說明在 `app/controllers/users_controller.rb` 最下方的 `user_params` 方法的用途。
def user_params
      params.require(:user).permit(:name, :email, :password)
  end
  #規定欄位只有name,email,password可以傳入，避免使用者隨意輸入欄位
