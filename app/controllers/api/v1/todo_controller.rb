class Api::V1::TodoController < ApplicationController
    before_action :authorize_request
    def update
        byebug
        list = params[:todoList]
        list.each do |todo| 
            wedding_todo = Todo.where("wedding_id = ? AND task_name = ?", params[:wedding_id], todo.task_name)
            if wedding_todo
                if (wedding_todo.isCompleted != todo.isCompleted)
                    wedding_todo.update(isCompleted: todo.isCompleted)
                end
            else
                new_todo = Todo.new(wedding_id: params[:wedding_id], task_name: todo.task_name, isCompleted: todo.isCompleted )
                new_todo.save()
            end
        end 

        render json: {message: "success"}, status: :ok
    end

end
