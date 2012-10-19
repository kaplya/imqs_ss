module Purch
  class PurchLinesController < ApplicationController
    # GET /purch_lines
    # GET /purch_lines.json
    def index
      @purch_lines = PurchLine.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @purch_lines }
      end
    end

    # GET /purch_lines/1
    # GET /purch_lines/1.json
    def show
      @purch_line = PurchLine.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @purch_line }
      end
    end

    # GET /purch_lines/new
    # GET /purch_lines/new.json
    def new
      @purch_line = PurchLine.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @purch_line }
      end
    end

    # GET /purch_lines/1/edit
    def edit
      @purch_line = PurchLine.find(params[:id])
    end

    # POST /purch_lines
    # POST /purch_lines.json
    def create
      @purch_line = PurchLine.new(params[:purch_line])

      respond_to do |format|
        if @purch_line.save
          format.html { redirect_to @purch_line, notice: 'Purch line was successfully created.' }
          format.json { render json: @purch_line, status: :created, location: @purch_line }
        else
          format.html { render action: "new" }
          format.json { render json: @purch_line.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /purch_lines/1
    # PUT /purch_lines/1.json
    def update
      @purch_line = PurchLine.find(params[:id])

      respond_to do |format|
        if @purch_line.update_attributes(params[:purch_line])
          format.html { redirect_to @purch_line, notice: 'Purch line was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @purch_line.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /purch_lines/1
    # DELETE /purch_lines/1.json
    def destroy
      @purch_line = PurchLine.find(params[:id])
      @purch_line.destroy

      respond_to do |format|
        format.html { redirect_to purch_lines_url }
        format.json { head :no_content }
      end
    end
  end
end