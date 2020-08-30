class BooksController < ApplicationController
  def index
      @books = Book.all
  end

  def create
      @book = Book.new(book_params)
      Book.all.each do |b|
          if b.name.downcase == @book.name.downcase
              flash[:notice] = "#{@book.name} already exists"
              render :new
              return
          end
      end
      if @book.save
          flash[:notice] = "Successfully added #{@book.name} to All Books"
          redirect_to books_path
      else
          flash[:notice] = "Book name cannot be blank"
          render :new
      end
  end

  def new
      @book = Book.new
  end

  def edit
      @spell = Spell.find(params[:id])
  end

  def show
      @book = Book.find(params[:id])
      @spells = @book.spells
  end

  def update
  end

  def destroy
      @book = Book.find(params[:id])
      if @book.destroy
          flash[:notice] = "#{@book.name} is succesfully deleted"
      else
          flash[:notice] = "Please try delete again"
      end
      redirect_to books_path
  end

  def delete_spell_from_book
      @book = Book.find(params[:b_id])
      @spell = Spell.find(params[:s_id])
      if @book.spells.destroy(@spell)
          flash[:notice] = "#{@spell.name} is deleted from #{@book.name}."
      else
          flash[:notice] = "Try delete the spell again"
      end
      redirect_to books_path
  end

  def add_spell_to_book
      @spell = Spell.find(params[:spell_id])
      @book = Book.find(params[:book_id])
      if @book.spells.include?(@spell)
          flash[:notice] = "#{@spell.name} already exists in #{@book.name}"
          render :edit
          return
      end
      if @book.spells.append(@spell)
          flash[:notice] = "Added #{@spell.name} to #{@book.name}."
      else
          flash[:notice] = "Try again"
      end
      redirect_to books_path
  end

  private
    def book_params
        params.require(:book).permit(:name)
    end

    def spell_params
        params.require(:spell).permit(:name, :level, :school, :concentration, :description, :spellclasses)
    end
end
