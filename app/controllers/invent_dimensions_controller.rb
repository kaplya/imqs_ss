class InventDimensionsController < ApplicationController
  # GET /invent_dimensions
  # GET /invent_dimensions.json
  def index
    @invent_dimensions = InventDimension.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invent_dimensions }
    end
  end

  # GET /invent_dimensions/1
  # GET /invent_dimensions/1.json
  def show
    @invent_dimension = InventDimension.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invent_dimension }
    end
  end

  # GET /invent_dimensions/new
  # GET /invent_dimensions/new.json
  def new
    @invent_dimension = InventDimension.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invent_dimension }
    end
  end

  # GET /invent_dimensions/1/edit
  def edit
    @invent_dimension = InventDimension.find(params[:id])
  end

  # POST /invent_dimensions
  # POST /invent_dimensions.json
  def create
    @invent_dimension = InventDimension.new(params[:invent_dimension])

    respond_to do |format|
      if @invent_dimension.save
        format.html { redirect_to @invent_dimension, notice: 'Invent dimension was successfully created.' }
        format.json { render json: @invent_dimension, status: :created, location: @invent_dimension }
      else
        format.html { render action: "new" }
        format.json { render json: @invent_dimension.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invent_dimensions/1
  # PUT /invent_dimensions/1.json
  def update
    @invent_dimension = InventDimension.find(params[:id])

    respond_to do |format|
      if @invent_dimension.update_attributes(params[:invent_dimension])
        format.html { redirect_to @invent_dimension, notice: 'Invent dimension was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invent_dimension.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invent_dimensions/1
  # DELETE /invent_dimensions/1.json
  def destroy
    @invent_dimension = InventDimension.find(params[:id])
    @invent_dimension.destroy

    respond_to do |format|
      format.html { redirect_to invent_dimensions_url }
      format.json { head :no_content }
    end
  end
end
