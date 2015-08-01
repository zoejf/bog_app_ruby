class CreaturesController < ApplicationController
	def index
		@creatures = Creature.all
		render :index
	end

  def new
    @creature = Creature.new
    render :new
  end

  def create
    creature_params= params.require(:creature).permit(:name, :description)
    @creature = Creature.new(creature_params)
    if @creature.save
      redirect_to "/creatures/#{@creature.id}"
    end
  end

  def show
    id = params[:id]
    @creature = Creature.find(id)
    render :show
  end

  def edit
    id = params[:id]
    @creature = Creature.find(id)
    render :edit
  end

  def update
    id = params[:id]
    creature = Creature.find(id)

    #get updated data from from
    updated_attributes = params.require(:creature).permit(:name, :description)
    #update the creature
    creature.update_attributes(updated_attributes)

    #redirect to show
    redirect_to "/creatures"
  end

  def destroy
    id = params[:id]
    creature = Creature.find(id)

    #delete specific creature
    creature.destroy
    redirect_to "/creatures"
  end

end