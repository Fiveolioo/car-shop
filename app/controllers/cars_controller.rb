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
      @car = Car.new(car_params)
      if @car.save
         @user = current_user
         redirect_to user_car_path(@user, @car)
      else
       render :new
      end
    end

    def show
      @car = car
      @user = current_user
    end

    def edit
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
              flash[:notice] = 'User not found.'
              redirect_to new_user_registration_path
            else
              @car = user.cars.find_by(id: params[:id])
              redirect_to user_cars_path(user), flash[:notice] = 'Car not found.' if @car.nil?
            end
        else
            @car = car
            @user = current_user
        end
    end

    def update
        @car = car
        @car.update(car_params)
        if @car.errors.none?
          @user = current_user
          redirect_to user_car_path(@user, @car)
        else
          render :edit
        end
    end

    def destroy
        car.destroy
        redirect_to root_path
    end

    private

    def car_params
      params.require(:car).permit(:make, :model, :color, :user_id, :nickname)
    end
  
    def car
      @car ||= Car.find(params[:id])
    end
end