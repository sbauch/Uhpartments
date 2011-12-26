class BuildingsController < ApplicationController     
  # GET /buildings
  # GET /buildings.json
  def index
      lat = params[:lat]
       lon = params[:lon]
       #@buildings = Building.where("ST_Distance(latlon, 'POINT ("+lon.to_s+" "+ lat.to_s + ")') < 200")
       @buildings = Building.near([lat, lon], 0.08 ).page(params[:page]).per_page(10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buildings }
    end
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    @building = Building.find(params[:id])
    @incidents_closed = @building.incidents.isclosed.page(params[:page]).per_page(10)
    @incidents_open = @building.incidents.isopen.page(params[:page]).per_page(10)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @building }
    end
  end
  # def set_geolocation
  #   #session[:location] = "'POINT (-74.03576870006731 40.7191652733036)') < 100"
  # 
  #  # lat = params[:latitude]
  #   #lon = params[:longitude]
  #   
  #    #session[:location] = "POINT (" + lon.to_s + " " + lat.to_s + ")"
  #    #@buildings = Building.where("POINT (" + @lon.to_s + " " + @lat.to_s + ")") < 100
  #    #@buildings = Building.where("ST_Distance(latlon, "+ @loc.to_s)
  #    @buildings = Building.where("ST_Distance(latlon, 'POINT (-74.03576870006731 40.6191652733036)') < 100")
  # 
  # end

  

  # GET /buildings/new
  # GET /buildings/new.json
  def new
    @building = Building.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @building }
    end
  end

  # GET /buildings/1/edit
  def edit
    @building = Building.find(params[:id])
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(params[:building])

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render json: @building, status: :created, location: @building }
      else
        format.html { render action: "new" }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.json
  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to buildings_url }
      format.json { head :ok }
    end
  end
end
#youlilfuckingsnaililovejewwww