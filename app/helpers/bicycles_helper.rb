module BicyclesHelper
  def can_suggest?
    !current_user&.suggestions&.exists?(bicycle_id: params[:id])
  end
end
