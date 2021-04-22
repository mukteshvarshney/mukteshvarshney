class StoreDetailsController < ApplicationController
	def index
    @store = StoreDetail.last(4)
    #@stores = StoreDetail.where("total_ratings > ?", 4)
  end

  def show
    @store = StoreDetail.find(params[:id])
    if params[:commit] == 'Save'
      puts "Save Commit" 
    elsif params[:commit] == 'Comment'
      puts "Comment Commit"
    end
  end

  def new
    @store = StoreDetail.new
  end

  def create
    @store = StoreDetail.new(store_detail_params)

    if @store.save
      flash.alert = "Store Create Sucessfully"
      redirect_to store_details_path
    else
      render :new
    end
  end

  def edit
    @store = StoreDetail.find(params[:id])
  end

  def update
    @store = StoreDetail.find(params[:id])

    if @store.update(store_detail_params)
      redirect_to store_details_path
    else
      render :edit
    end
  end

  private

  def store_detail_params
  	params.require(:store_detail).permit(:name, :store_type, :address, :owner_name, :owner_number, :timing, :remark, :status, :total_ratings)
  end
end
