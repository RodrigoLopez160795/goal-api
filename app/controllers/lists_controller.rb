class ListsController < ApplicationController
    def list_name
        list = List.find(current_user.list_id)
        render json: list
    end
end
