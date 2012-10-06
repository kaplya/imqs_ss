class InventOnhandsController < ApplicationController
  # GET /invent_onhands
  # GET /invent_onhands.json
  def index
    @invent_onhands = InventOnhand.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invent_onhands }
    end
  end

  # GET /invent_onhands/1
  # GET /invent_onhands/1.json
  def show
    @invent_onhand = InventOnhand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invent_onhand }
    end
  end

  # GET /invent_onhands/new
  # GET /invent_onhands/new.json
  def new
    @invent_onhand = InventOnhand.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invent_onhand }
    end
  end

  # GET /invent_onhands/1/edit
  def edit
    @invent_onhand = InventOnhand.find(params[:id])
  end

  # POST /invent_onhands
  # POST /invent_onhands.json
  def create
    @invent_onhand = InventOnhand.new(params[:invent_onhand])

    respond_to do |format|
      if @invent_onhand.save
        format.html { redirect_to @invent_onhand, notice: 'Invent onhand was successfully created.' }
        format.json { render json: @invent_onhand, status: :created, location: @invent_onhand }
      else
        format.html { render action: "new" }
        format.json { render json: @invent_onhand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invent_onhands/1
  # PUT /invent_onhands/1.json
  def update
    @invent_onhand = InventOnhand.find(params[:id])

    respond_to do |format|
      if @invent_onhand.update_attributes(params[:invent_onhand])
        format.html { redirect_to @invent_onhand, notice: 'Invent onhand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invent_onhand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invent_onhands/1
  # DELETE /invent_onhands/1.json
  def destroy
    @invent_onhand = InventOnhand.find(params[:id])
    @invent_onhand.destroy

    respond_to do |format|
      format.html { redirect_to invent_onhands_url }
      format.json { head :no_content }
    end
  end
end
