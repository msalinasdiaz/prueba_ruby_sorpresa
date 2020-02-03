class TodosController < ApplicationController
    def index
        @todos = Todo.all
    end
    
    def new
        @todo = Todo.new
    end
    
    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            flash[:notice] = "Your new was added successfully"
            redirect_to root_path
        else 
            render 'new'
        end
    end
    
    def show
        @todo = Todo.find(params[:id])
    end 
    
    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to todos_path
    end
    
    def edit
        @todo = Todo.find(params[:id])
    end
    
    
    def complete
        @todo = Todo.find(params[:id])
        if @todo.completed == false
            @todo.completed = true
            @todo.save
            flash[:notice] = "Completed!"
            redirect_to todos_path
        else
            redirect_to todos_path
        end
    end
    def update
        @todo = Todo.find(params[:id])
        if @todo.update (todo_params)
            flash[:notice] = "Your new tarea was updated succesful"
            redirect_to root_path(@todo)
        else
            render 'edit'
        end
    end 
    def list
        @todo_completed = Todo.where(completed: true)
        @todo_incompleted = Todo.where(completed: false) 
    end 
    
    private
    def todo_params
        params.require(:todo).permit(:description, :completed)
        
    end
end
