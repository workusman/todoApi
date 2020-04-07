class Api::V1::TodosController < ApplicationController
  before_action :set_todo, only: [:destroy, :update]

  def index
    todos = Todo.where.not(task: nil).order(created_at: :desc).limit 3
    render json:  todos.to_json
  end

  def create
    if Todo.create todo_params
      render json: {status: 200}
    else
      render json: {Error: "Unable to create record"}
    end
  end

  def update
    if @todo.update completed: true
      render json: { status: "OK" }
    else
      render json: { error: "Error" }
    end
  end

  def destroy
    if @todo.destroy
      render json: { status: "OK" }
    else
      render json: { error: "Error" }
    end
  end

  private
  def set_todo
    @todo = Todo.find params[:id]
  end
  def todo_params
    params.require(:todo).permit(:task, :completed)
  end
end