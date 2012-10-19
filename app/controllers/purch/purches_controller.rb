module Purch
  class PurchesController < ApplicationController
    # GET /purches
    # GET /purches.json
    def index
      @purches = ::Purch::Purch.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @purches }
      end
    end

    # GET /purches/1
    # GET /purches/1.json
    def show
      @purch = Purch.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @purch }
      end
    end

    # GET /purches/new
    # GET /purches/new.json
    def new
      @purch = Purch.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @purch }
      end
    end

    # GET /purches/1/edit
    def edit
      @purch = Purch.find(params[:id])
    end

    # POST /purches
    # POST /purches.json
    def create
      @purch = Purch.new(params[:purch])

      respond_to do |format|
        if @purch.save
          format.html { redirect_to @purch, notice: 'Purch was successfully created.' }
          format.json { render json: @purch, status: :created, location: @purch }
        else
          format.html { render action: "new" }
          format.json { render json: @purch.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /purches/1
    # PUT /purches/1.json
    def update
      @purch = Purch.find(params[:id])

      respond_to do |format|
        if @purch.update_attributes(params[:purch])
          format.html { redirect_to @purch, notice: 'Purch was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @purch.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /purches/1
    # DELETE /purches/1.json
    def destroy
      @purch = Purch.find(params[:id])
      @purch.destroy

      respond_to do |format|
        format.html { redirect_to purches_url }
        format.json { head :no_content }
      end
    end
  end
end