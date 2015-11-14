class StopsController < ApplicationController
  before_action :set_stop, only: [:show, :edit, :update, :destroy]

  # GET /stops
  # GET /stops.json
  def index
    @stops = Stop.all
  end

  # GET /stops/1
  # GET /stops/1.json
  def show
  end

  def search_stop
    response = HTTParty.get('http://api.translink.ca/rttiapi/v1/routes/99?apikey=UeuMwgvJ7kQ2cgFuDMVr', :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
    body = JSON.parse(response.body)
  end

  # GET /stops/new
  def new
    @stop = Stop.new
  end

  # GET /stops/1/edit
  def edit
  end

  # POST /stops
  # POST /stops.json
  def create
    @stop = Stop.new(stop_params)

    respond_to do |format|
      if @stop.save
        format.html { redirect_to @stop, notice: 'Stop was successfully created.' }
        format.json { render :show, status: :created, location: @stop }
      else
        format.html { render :new }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stops/1
  # PATCH/PUT /stops/1.json
  def update
    respond_to do |format|
      if @stop.update(stop_params)
        format.html { redirect_to @stop, notice: 'Stop was successfully updated.' }
        format.json { render :show, status: :ok, location: @stop }
      else
        format.html { render :edit }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stops/1
  # DELETE /stops/1.json
  def destroy
    @stop.destroy
    respond_to do |format|
      format.html { redirect_to stops_url, notice: 'Stop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stop
      @stop = Stop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stop_params
      params.require(:stop).permit(:stopNumber, :onStreet, :atStreet, :lat, :lon)
    end
end
