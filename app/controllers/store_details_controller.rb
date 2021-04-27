class StoreDetailsController < ApplicationController
	def index
    @stores = StoreDetail.last(4)
    @stores_top = StoreDetail.where(total_ratings: ["4","5"])
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
      respond_to do |format|
        format.html { redirect_to store_details_path }
        format.js { redirect_to store_details_path }
      end
    else
      render :edit
    end
  end


  def delete_image_attachment
    @image = ActiveStorage::Blob.find(params[:id])
    @image.attachments.first.purge
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  private

  def store_detail_params
  	params.require(:store_detail).permit(:name, :store_type, :address, :owner_name, :owner_number, :timing, :remark, :status, :total_ratings, image: [])
  end
end
