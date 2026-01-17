class EmployeesController < ApplicationController

    # Get employees /employees
    def index
      employees=Employee.all
      render json: employees
    end  

    # Get employees/:id

    def show
      employee=Employee.find(params[:id])
      render json: employee
      
      rescue ActiveRecord::RecordNotFound
        render json: {errors:"Employee not found"}, status: :not_found
    end  

    # post /employees
     def create
        employee = Employee.new(employee_params)
        if employee.save
          render json: employee, status: :created
        else
          render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
        end
     end
    
     # put /employees/:id 

     def update
        employee=Employee.find(params[:id])
        if employee.update(employee_params)
          render json: employee
        else  
           render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
        end 
     end

     # delete /employee/:id

     def destroy
        employee=Employee.find(params[:id])
        employee.destroy
        render json: {message: "Employee deleted successfully"}
     end 

     private
      def employee_params
        params.require(:employee).permit(:name,:email)
      end 
end
