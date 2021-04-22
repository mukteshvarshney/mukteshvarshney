class StoreRatingsController < ApplicationController

	def create
    @store = StoreDetail.find(params[:store_detail_id])
    @rating = @store.store_ratings.create(store_rating_params)
    redirect_to store_detail_path(@store)
  end

  private
    def store_rating_params
      params.require(:store_rating).permit(:store_rating_with_comments, :given_by)
    end
end
