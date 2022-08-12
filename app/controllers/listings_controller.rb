class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @listing.build_pet
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    # debugger
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        flash[:error] = @listing.errors.count.to_s + " error".pluralize(@listing.errors.count) + ' prohibited this listing from being saved'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:listing_type, :last_seen, :address, :description, :user_id, pet_attributes: [:id, :name, :species])
      # , pet_attributes: [:id, :name, :species]
      # require(:listing).permit(:listing_type, :last_seen, :address, :description, :user_id, pet_attributes: Pet.attribute_names.map(&:to_sym).push(:destroy))
    end
end
# listing_params
# p1 = params.require(:listing).permit(:listing_type, :last_seen, :address, :description, :user_id, :pet_attributes => [:name, :species])
# p1.require(:pet_attributes).permit(:name, :species)
# p2 = params.require(:pet).permit(:name, :species)
