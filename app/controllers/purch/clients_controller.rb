class Purch::ClientsController < ApplicationController
  # GET /purch/clients
  # GET /purch/clients.json
  def index
    @purch_clients = Purch::Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purch_clients }
    end
  end

  # GET /purch/clients/1
  # GET /purch/clients/1.json
  def show
    @purch_client = Purch::Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @purch_client }
    end
  end

  # GET /purch/clients/new
  # GET /purch/clients/new.json
  def new
    @purch_client = Purch::Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purch_client }
    end
  end

  # GET /purch/clients/1/edit
  def edit
    @purch_client = Purch::Client.find(params[:id])
  end

  # POST /purch/clients
  # POST /purch/clients.json
  def create
    @purch_client = Purch::Client.new(params[:purch_client])

    respond_to do |format|
      if @purch_client.save
        format.html { redirect_to @purch_client, notice: 'Client was successfully created.' }
        format.json { render json: @purch_client, status: :created, location: @purch_client }
      else
        format.html { render action: "new" }
        format.json { render json: @purch_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /purch/clients/1
  # PUT /purch/clients/1.json
  def update
    @purch_client = Purch::Client.find(params[:id])

    respond_to do |format|
      if @purch_client.update_attributes(params[:purch_client])
        format.html { redirect_to @purch_client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purch_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch/clients/1
  # DELETE /purch/clients/1.json
  def destroy
    @purch_client = Purch::Client.find(params[:id])
    @purch_client.destroy

    respond_to do |format|
      format.html { redirect_to purch_clients_url }
      format.json { head :no_content }
    end
  end
end
