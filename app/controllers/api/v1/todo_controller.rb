class Api::V1::TodoController < ApplicationController

    before_action :authorize_request
    
    def update
        returnList = []
        list = params[:todoList]
        list.each do |todo| 
            wedding_todo = ToDo.where("wedding_id = ? AND todo_name = ?", params[:wedding_id], todo[:todo_name])
            
            if (wedding_todo.size > 0 )
                
                if (wedding_todo[0][:isCompleted] != todo[:isCompleted])
                    wedding_todo.update(isCompleted: todo[:isCompleted])
                    returnList << wedding_todo[0]
                else
                    returnList << wedding_todo[0]
                end

            else
                new_todo = ToDo.new(wedding_id: params[:wedding_id].to_i, todo_name: todo[:todo_name], isCompleted: todo[:isCompleted] )
                new_todo.save()
                returnList << new_todo
            end
        end 

        render json: {message: "success", list: returnList}, status: :ok
    end

end
