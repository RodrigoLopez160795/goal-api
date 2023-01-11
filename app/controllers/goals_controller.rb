class GoalsController < ApplicationController
  def index_by_list
    list = List.find(current_user.list_id)
    goals = Goal.where(list_id: list.id)
    render json: goals
  end

  def create
    goal = Goal.new(goal_params)
    if goal.save
      render json: goal, status: :created
    else
      render json: { errors: goal.errors }, status: :unprocessable_entity
    end
  end

  def show
    @id = params[:id]
    goal = Goal.where('id = ?', @id)
    if goal.length.positive?
      render json: goal
    else
      render json: { errors: 'Not found' }, status: :not_found
    end
  end

  def update
    @id = params[:id]
    goal = Goal.find(@id)
    if goal.update(goal_params)
      render json: goal
    else
      render json: { errors: goal.errors }, status: :unprocessable_entity
    end
  end

  private

  def goal_params
    params.permit(:name, :description, :post_by, :list_id, :finish_at,
                  :finish).with_defaults(list_id: current_user.list_id)
  end
end
