class LaundromatsController < ApplicationController
  # GET /laundromats
  # GET /laundromats.json
  def index
    @laundromats = Laundromat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @laundromats }
    end
  end

  # GET /laundromats/1
  # GET /laundromats/1.json
  def show
    @laundromat = Laundromat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @laundromat }
    end
  end

  # GET /laundromats/new
  # GET /laundromats/new.json
  def new
    @laundromat = Laundromat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @laundromat }
    end
  end

  # GET /laundromats/1/edit
  def edit
    @laundromat = Laundromat.find(params[:id])
  end

  # POST /laundromats
  # POST /laundromats.json
  def create
    @laundromat = Laundromat.new(params[:laundromat])

    respond_to do |format|
      if @laundromat.save
        format.html { redirect_to @laundromat, notice: 'Laundromat was successfully created.' }
        format.json { render json: @laundromat, status: :created, location: @laundromat }
      else
        format.html { render action: "new" }
        format.json { render json: @laundromat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /laundromats/1
  # PUT /laundromats/1.json
  def update
    @laundromat = Laundromat.find(params[:id])

    respond_to do |format|
      if @laundromat.update_attributes(params[:laundromat])
        format.html { redirect_to @laundromat, notice: 'Laundromat was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @laundromat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laundromats/1
  # DELETE /laundromats/1.json
  def destroy
    @laundromat = Laundromat.find(params[:id])
    @laundromat.destroy

    respond_to do |format|
      format.html { redirect_to laundromats_url }
      format.json { head :ok }
    end
  end
end
