  def new                     #建立@user為User類別實體。
    @user = User.new
  end

  def edit                    #編輯。
  end

  def create                        #把清洗過的資料放入@user實體。
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save                   #如果已完成儲存，跳轉到user頁面，並提示'User was successfully created.'。
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }   #如果失敗，則重新render新增頁面。
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update              
    respond_to do |format|          #把清洗過的資料做更新，如果更新完成，跳轉到user頁面，並提示'User was successfully updated.'。
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }    #如果失敗，則重新render編輯頁面。
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params                                           #將使用者傳來的資料做清洗，只有name、email、password欄位才可以通過，避免使用者任意儲存。
    params.require(:user).permit(:name, :email, :password)
  end
