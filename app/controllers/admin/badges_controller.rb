class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: [:show, :edit, :update, :destroy]

  def new
    @badge = Badge.new    
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: 'Badge successfully created'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: 'Badge successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to badges_path, notice: 'Badge successfully deleted'
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :file_name, :rule_name, :rule_value)  
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end
