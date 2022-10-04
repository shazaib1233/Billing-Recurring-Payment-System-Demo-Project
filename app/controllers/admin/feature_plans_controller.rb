class Admin::FeaturePlansController < Admin::BaseController
  before_action :set_feature_plan, only: %i[ show edit update destroy ]

  def index
    @feature_plans = FeaturePlan.all
  end

  def show; end

  def new
    @feature_plan = FeaturePlan.new
  end

  def edit; end

  def create
    @feature_plan = FeaturePlan.new(feature_plan_params)

      if @feature_plan.save
        redirect_to admin_feature_plan_url(@feature_plan), notice: "Feature plan was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @feature_plan.update(feature_plan_params)
        redirect_to admin_feature_plan_url(@feature_plan), notice: "Feature plan was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @feature_plan.destroy

    redirect_to admin_feature_plans_url, notice: "Feature plan was successfully destroyed."
  end

  private
    def set_feature_plan
      @feature_plan = FeaturePlan.find(params[:id])
    end

    def feature_plan_params
      params.require(:feature_plan).permit(:plan_id, :feature_id, :allocated_units)
    end
end
