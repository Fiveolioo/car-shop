class AppointmentsController < ApplicationController
   
    def index
        if params[:user_id]
            @appointments = User.find(params[:user_id]).appointments
            @user = User.find(params[:user_id])
        else
            redirect_to user_appointments_path
        end
    end

    def new
    end

    def create
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

    def appointment_params
    end
end