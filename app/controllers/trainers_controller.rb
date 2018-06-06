class TrainersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @trainers = Trainer.all

  end

  def show
    @trainer = Trainer.find(params[:id])
    @expertise = Expertise.find(@trainer[:expertise_id])
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(params[:trainer])
    @trainer.save
  end

  def edit
    @trainer = Trainer.find(params[:id])

  end

  def update
    @trainer = Trainer.find(params[:id])
    @trainer.update(params[:trainer_params])
  end

  def destroy
    @trainer = Trainer.find(paramas[:id])
    @trainer.destroy
  end



private
  def trainer_params
    params.require(:trainer).permit(:expertise_id,:hourly_rate)
  end
end
