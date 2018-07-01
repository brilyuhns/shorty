class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show, :info, :edit, :update, :destroy]

  # GET /short_urls
  # GET /short_urls.json
  def index
    @short_urls = ShortUrl.all
  end

  # GET /short_urls/1
  # GET /short_urls/1.json
  def show
    redirect_to @short_url.original_url
  end

  # GET /short_urls/new
  def new
    @short_url = ShortUrl.new
  end

  # POST /short_urls
  # POST /short_urls.json
  def create
    @short_url = ShortUrl.new(short_url_params)
    @short_url.assign_code
    respond_to do |format|
      if @short_url.save
        format.html { redirect_to info_short_url_url(@short_url), notice: 'Short url was successfully created.' }
        format.json { render :info, status: :created, location: @short_url }
      else
        format.html { render :new }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /short_urls/1
  # GET /short_urls/1.json
  def info
  end

  # DELETE /short_urls/1
  # DELETE /short_urls/1.json
  def destroy
    @short_url.destroy
    respond_to do |format|
      format.html { redirect_to short_urls_url, notice: 'Short url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_url
      puts params
      @short_url = ShortUrl.find_by_code!(params[:code])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_url_params
      params.require(:short_url).permit(:original_url)
    end
end
