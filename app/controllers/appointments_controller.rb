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
        @appointment = appointment
        @user = current_user
    end

    def edit
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
              redirect_to new_user_registration_path, flash[:notice] = 'User not found.'
            else
              @appointment = user.appointments.find_by(id: params[:id])
              redirect_to user_appointments_path(user), 
              flash[:notice] = 'Appointment not found.' if @appointment.nil?
            end
        else
            @appointment = appointment
            @user = current_user
        end
    end

    def update
        @appointment = appointment
        @appointment.update(appointment_params)
        if @appointment.errors.none?
          @user = current_user
          redirect_to user_appointment_path(@user, @appointment)
        else
          render :edit
        end
    end

    def destroy
        appointment.destroy
        redirect_to root_path
    end

    private

    def appointment_params
        params.require(:appointment).permit(:reason_for_visit, :date_time, :user_id, :car_id, :shop_id)
    end

    def appointment
        @appointment ||= Appointment.find(params[:id])
    end
end