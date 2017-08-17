class UsersController < ApplicationController
  layout 'user'
  
  def index
    @msg = 'Users data.'
    @data = User.all.order('created_at desc')
  end
  
  def add
    @msg = "add new data"
    @user = User.new
  end
  
  def create
    if request.post? then
      @user = User.new(user_params)
      if @user.save then
        redirect_to '/user'
      else
        render 'add'
      end
    else
      redirect_to '/user'
    end
  end
  
  def edit
      @msg = " edit data.[id = " + params[:id] + "]"
      @user = User.find(params[:id])
  end
  
  def update
      obj = User.find(params[:id])
      if obj.update(user_params)
        redirect_to '/user'
      else
        render 'edit'
      end
  end
  
def find
	@msg = 'please type search word...'
	@user = Array.new
	if request.post? then
    f = params[:find].split(',')
    @user = User.all.limit(f[0]).offset(f[1])
  else
    @user = User.all
	end
end

  
  def delete
      obj = User.find(params[:id])
      obj.destroy
      redirect_to '/user'
  end
  
  def show
    @msg = "Indexed data."
    @data = User.find(params[:id])  #params[:id]が引数。指定したIDのデータを取り出す。
  end
  
end

private

def user_params
  params.require(:user).permit(:name, :kana, :memo, :division_id)
end