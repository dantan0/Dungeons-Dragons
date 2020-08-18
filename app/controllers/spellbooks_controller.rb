class SpellbooksController < ApplicationController
  def index
  end

  def create
  end

  def new
      @book = Book.find(params[:b_id])
      @spells = Spell.all
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
