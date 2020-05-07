class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])   #find_byはどのカラムでも指定できる findはidだけ
  	@book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
	  @user = User.find(params[:id])
	  if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
    	render "edit"
    end
  end

  def index
  	@user = User.find(current_user.id)
  	@users = User.all
  	@book = Book.new
  end

  def search
    @user_or_book = params[:option]  #viewの記述よりparamsで送られるのは文字列
    @how_search = params[:choice]
    if @user_or_book == "1"
      @users = User.search(params[:search], @user_or_book, @how_search)
    else
      @books = Book.search(params[:search], @user_or_book, @how_search)
    end
  end

  private #user_paramsアクションは他のコントローラーのアクションでも働く privateがあることによってこのコントローラーでしか働かない
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

