class CarsController < ApplicationController
    
    def index
        if params[:user_id]
            @cars = User.find(params[:user_id]).cars
            @user = User.find(params[:user_id])
        else
            redirect_to user_cars_path
        end
    end

   
    def new
      if params[:user_id] && !User.exists?(params[:user_id])
      flash[:notice] = 'User not found.'
      redirect_to new_user_registration_path
      else
      @car = Car.new(user_id: params[:user_id])
      end
    end

    def create
      @car = Car.new(pet_params)
      if @car.save
       @user = current_user
       redirect_to user_car_path(@user, @car)
      else
       render :new
      end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def car_params
      params.require(:car).permit(:make, :model, :color)
    end
  
    def car
      @car ||= Car.find(params[:id])
    end
end