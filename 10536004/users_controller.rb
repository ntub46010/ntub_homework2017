def new
  @user = User.new
end
#用User Model 建立一個實體給@user實體變數，來給view/users/new.html.erb 的表單使用

def create
  @user = User.new(user_params)
#使用清洗過的資料建立一個實體給@user
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
#respond_to do 依照下面不同的情況回應不同的資料格式
#如果成功建立使用者，彈出成功建立的訊息，跳到show頁面顯示使用者資料
#如果未成功，跳到new的頁面

def edit
end
#到edit頁面，顯示該筆資料，來編輯

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
#帶入清洗的資料，更新資料
#成功:彈出成功更新，跳到show頁面，顯示使用者資料
#失敗:跳到edit頁面

def user_params
  params.require(:user).permit(:name, :email, :password)
end
#清洗傳過來的資料，只有name、email、password欄位的值才能傳進來
