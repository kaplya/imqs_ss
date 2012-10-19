end
  class PackingSlipsController < ApplicationController
    # GET /packing_slips
    # GET /packing_slips.json
    def index
      @packing_slips = PackingSlip.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @packing_slips }
      end
    end

    # GET /packing_slips/1
    # GET /packing_slips/1.json
    def show
      @packing_slip = PackingSlip.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @packing_slip }
      end
    end

    # GET /packing_slips/new
    # GET /packing_slips/new.json
    def new
      @packing_slip = PackingSlip.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @packing_slip }
      end
    end

    # GET /packing_slips/1/edit
    def edit
      @packing_slip = PackingSlip.find(params[:id])
    end

    # POST /packing_slips
    # POST /packing_slips.json
    def create
      @packing_slip = PackingSlip.new(params[:packing_slip])

      respond_to do |format|
        if @packing_slip.save
          format.html { redirect_to @packing_slip, notice: 'Packing slip was successfully created.' }
          format.json { render json: @packing_slip, status: :created, location: @packing_slip }
        else
          format.html { render action: "new" }
          format.json { render json: @packing_slip.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /packing_slips/1
    # PUT /packing_slips/1.json
    def update
      @packing_slip = PackingSlip.find(params[:id])

      respond_to do |format|
        if @packing_slip.update_attributes(params[:packing_slip])
          format.html { redirect_to @packing_slip, notice: 'Packing slip was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @packing_slip.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /packing_slips/1
    # DELETE /packing_slips/1.json
    def destroy
      @packing_slip = PackingSlip.find(params[:id])
      @packing_slip.destroy

      respond_to do |format|
        format.html { redirect_to packing_slips_url }
        format.json { head :no_content }
      end
    end
  end
end