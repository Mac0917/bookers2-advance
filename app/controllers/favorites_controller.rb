class FavoritesController < ApplicationController
    def create
        favorite = Favorite.new(book_id: params[:book_id], user_id: current_user.id) #link_toでid番号だけだからストロングパラメーターいらない
        favorite.save
        redirect_to request.referer  #もとの遷移先にいく、もとをgetに変える
    end

    def destroy
        favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
        favorite.destroy
        redirect_to request.referer
    end
end

#def create
    #book = Book.find(params[:book_id])
    #favorite = Favorite.new(book_id: params[:book_id], user_id: current_user.id)
    #favorite.save
    #redirect_to books_path
#end

#def destroy
    #book = Book.find(params[:book_id])
    #favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    #favorite.destroy
    #redirect_to books_path
#end