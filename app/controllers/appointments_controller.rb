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
        if params[:user_id] && !User.exists?(params[:user_id])
            flash[:notice] = 'User not found.'
            redirect_to new_user_registration_path
        else
            @appointment = Appointment.new(user_id: params[:user_id])
        end
    end

    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
          @user = current_user
          redirect_to user_appointment_path(@user, @appointment)
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

    def appointment_params
    end
end