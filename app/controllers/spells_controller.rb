class SpellsController < ApplicationController
  def index
      @spells = Spell.order_by
      @spellclasses = Spellclass.all
  end

  def create
      @spell = Spell.new(spell_params)
      Spell.all.each do |s|
          if s.name.downcase == @spell.name.downcase
              flash[:notice] = "Spell name cannot be the same as an existing spell"
              render :new
              return
          end
      end
      if @spell.name == ""
          flash[:notice] = "Spell name cannot be blank"
          render :new
          return
      elsif @spell.school == ""
          flash[:notice] = "Spell school cannot be blank"
          render :new
          return
      elsif @spell.description == ""
          flash[:notice] = "Description cannot be blank"
          render :new
          return
      end
      if @spell.save
          flash[:notice] = "Successfully added #{@spell.name} to All Spells"
          redirect_to spells_path
      else
          flash[:notice] = "An error has occurred"
          render :new
      end
  end

  def new
      @spell = Spell.new
  end

  def edit
      @spell = Spell.find(params[:id])
  end

  def show
      @spell = Spell.find(params[:id])
  end

  def update
      @spell = Spell.find(params[:id])
      if @spell.update(spell_params)
          flash[:notice] = "Successfully edited #{@spell.name}"
          redirect_to spells_path
      else
          flash[:notice] = "Please try edit again"
          render :edit
      end
  end

  def destroy
      @spell = Spell.find(params[:id])
      if @spell.destroy
          flash[:notice] = "#{@spell.name} is successfully deleted"
          redirect_to spells_path
      else
          flash[:notice] = "Please try delete again"
          render :edit
      end
  end
  
  private
    def spell_params
        params.require(:spell).permit(:name, :level, :school, :concentration, :description, :spellclasses)
    end
end