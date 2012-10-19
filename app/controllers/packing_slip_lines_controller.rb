module Purch
  class PackingSlipLinesController < ApplicationController
    # GET /packing_slip_lines
    # GET /packing_slip_lines.json
    def index
      @packing_slip_lines = PackingSlipLine.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @packing_slip_lines }
      end
    end

    # GET /packing_slip_lines/1
    # GET /packing_slip_lines/1.json
    def show
      @packing_slip_line = PackingSlipLine.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @packing_slip_line }
      end
    end

    # GET /packing_slip_lines/new
    # GET /packing_slip_lines/new.json
    def new
      @packing_slip_line = PackingSlipLine.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @packing_slip_line }
      end
    end

    # GET /packing_slip_lines/1/edit
    def edit
      @packing_slip_line = PackingSlipLine.find(params[:id])
    end

    # POST /packing_slip_lines
    # POST /packing_slip_lines.json
    def create
      @packing_slip_line = PackingSlipLine.new(params[:packing_slip_line])

      respond_to do |format|
        if @packing_slip_line.save
          format.html { redirect_to @packing_slip_line, notice: 'Packing slip line was successfully created.' }
          format.json { render json: @packing_slip_line, status: :created, location: @packing_slip_line }
        else
          format.html { render action: "new" }
          format.json { render json: @packing_slip_line.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /packing_slip_lines/1
    # PUT /packing_slip_lines/1.json
    def update
      @packing_slip_line = PackingSlipLine.find(params[:id])

      respond_to do |format|
        if @packing_slip_line.update_attributes(params[:packing_slip_line])
          format.html { redirect_to @packing_slip_line, notice: 'Packing slip line was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @packing_slip_line.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /packing_slip_lines/1
    # DELETE /packing_slip_lines/1.json
    def destroy
      @packing_slip_line = PackingSlipLine.find(params[:id])
      @packing_slip_line.destroy

      respond_to do |format|
        format.html { redirect_to packing_slip_lines_url }
        format.json { head :no_content }
      end
    end
  end
end