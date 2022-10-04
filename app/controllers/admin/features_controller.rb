class Admin::FeaturesController < Admin::BaseController
  before_action :set_feature, only: %i[ show edit update destroy ]

  def index
    @features = Feature.all
  end

  def show; end

  def new
    @feature = Feature.new
  end

  def edit; end

  def create
    @feature = Feature.new(feature_params)

    if @feature.save
      redirect_to admin_features_path, notice: 'Feature was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @feature.update(feature_params)
      redirect_to admin_features_path, notice: 'Feature was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @feature.destroy
    redirect_to admin_features_path, notice: 'Feature was successfully deleted.'
  end

  private

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit)
  end

end
