class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # Create new, empty instance variable
    @task = Task.new
  end

  def create
    # When click submit on form => create task instance
    # params[:task] => see new.html.erb view
    # params - hash with key task
    # task's value is hash with keys - title, details and completed
    # params[:task] into Task.new => rather than input title, details and completed separately
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    # .update - involves save method
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  # Cannot save data without using Strong Params

  # Before private method => create method:
  # @task = Task.new(params[:task])
  # @task.save
  # Will raise ActiveModel::ForbiddenAttributesError
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
