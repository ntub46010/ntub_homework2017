
* 修改`Routes`表，產生出以下8個路徑

```ruby 
    tests GET    /tests(.:format)               tests#index                                                                                                                                                  
          POST   /tests(.:format)               tests#create                                                                                                                                                 
new_test  GET    /tests/new(.:format)           tests#new                                                                                                                                                    
edit_test GET    /tests/:id/edit(.:format)      tests#edit                                                                                                                                                   
     test GET    /tests/:id(.:format)           tests#show                                                                                                                                                   
          PATCH  /tests/:id(.:format)           tests#update                                                                                                                                                 
          PUT    /tests/:id(.:format)           tests#update                                                                                                                                                 
          DELETE /tests/:id(.:format)           tests#destroy   
```

* 新增`controller`，在`controller`中定義對應的`action`，並在`action`中設定基本的 `model`，通常為查詢新增修改刪除。在`action`對應的`view`做資料驗證。

```ruby=
class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.fetch(:test, {})
    end
end
```
* 會在 `db` 資料夾中的 `migrate` 資料夾，產生出一個跟 資料庫 table 對應的檔案 ruby 設定檔

```ruby
class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|

      t.timestamps
    end
  end
end

```

* 會產生出8張`view`，5張為html格式(_form.html.erb、edit.html.erb、index.html.erb、new.html.erb、show.html.erb)，3張為json格式。(_xxx.json.jbuilder、index.json.jbuilder、show.json.jbuilder)
