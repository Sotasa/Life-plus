class HabitsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @habits = Habit.all
  end

  def new
    @habit = Habit.new
  end

  def show
    @habit = Habit.find(params[:id])

    @comments = @habit.comments
    @comment = Comment.new
  end

  def create
    habit = Habit.new(habit_params)

    habit.user_id = current_user.id

    if habit.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def edit
    @habit = Habit.find(params[:id])
  end

  def update
    habit = Habit.find(params[:id])
    if habit.update(habit_params)
      redirect_to :action => "show", :id => habit.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    habit = Habit.find(params[:id])
    habit.destroy
    redirect_to action: :index
  end

  private
  def habit_params
    params.require(:habit).permit(:m_time, :n_time, :about, :user_id, :task)
  end
end
