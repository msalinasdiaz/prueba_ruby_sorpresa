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
    def edit
        @todo = Todo.find(params[:id])
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
private
    def todo_params
        params.require(:todo).permit(:description, :completed)
        
    end
end
