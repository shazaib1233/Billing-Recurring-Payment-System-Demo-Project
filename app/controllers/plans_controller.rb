class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show edit update destroy ]
  before_action :validate_admin, except: %i[ index show ]

  def index
    @plans = Plan.all
  end

  def show; end

  def new
    @plan = Plan.new
  end

  def edit; end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id


    if @plan.save
      redirect_to root_path, notice: 'Plan was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @plan.update(plan_params)
      redirect_to plan_url(@plan), notice: 'Plan was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plan.destroy
    redirect_to root_path, notice: 'Plan was successfully destroyed.'
  end

  private
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:name, :monthly_fee, features_attributes: [:id, :name, :code, :unit_price, :max_unit_limit, :_destroy])
    end

    def validate_admin
      return if current_user&.admin?

      redirect_to root_path, alert: 'Invalid Access'
    end
end
