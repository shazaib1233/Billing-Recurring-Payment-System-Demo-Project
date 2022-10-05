class Admin::PlansController < Admin::BaseController
  before_action :set_plan, only: %i[ show edit update destroy ]

  def index
    @plans = Plan.all
  end

  def show; end

  def new
    @plan = Plan.new
  end

  def edit; end

  def create
    @plan = Plan.new(plan_params.merge(user_id: current_user.id))

    if @plan.save
      redirect_to root_path, notice: 'Plan was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @plan.update(plan_params.merge(user_id: current_user.id))
      redirect_to admin_plan_url(@plan), notice: 'Plan was successfully updated.'
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
    params.require(:plan).permit(:name, :monthly_fee, feature_plans_attributes: [:id, :plan_id, :feature_id, :allocated_units, :_destroy])
  end

end
