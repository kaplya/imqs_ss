class InventTransactionsController < ApplicationController
  # GET /invent_transactions
  # GET /invent_transactions.json
  def index
    @invent_transactions = InventTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invent_transactions }
    end
  end

  # GET /invent_transactions/1
  # GET /invent_transactions/1.json
  def show
    @invent_transaction = InventTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invent_transaction }
    end
  end

  # GET /invent_transactions/new
  # GET /invent_transactions/new.json
  def new
    @invent_transaction = InventTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invent_transaction }
    end
  end

  # GET /invent_transactions/1/edit
  def edit
    @invent_transaction = InventTransaction.find(params[:id])
  end

  # POST /invent_transactions
  # POST /invent_transactions.json
  def create
    @invent_transaction = InventTransaction.new(params[:invent_transaction])

    respond_to do |format|
      if @invent_transaction.save
        format.html { redirect_to @invent_transaction, notice: 'Invent transaction was successfully created.' }
        format.json { render json: @invent_transaction, status: :created, location: @invent_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @invent_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invent_transactions/1
  # PUT /invent_transactions/1.json
  def update
    @invent_transaction = InventTransaction.find(params[:id])

    respond_to do |format|
      if @invent_transaction.update_attributes(params[:invent_transaction])
        format.html { redirect_to @invent_transaction, notice: 'Invent transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invent_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invent_transactions/1
  # DELETE /invent_transactions/1.json
  def destroy
    @invent_transaction = InventTransaction.find(params[:id])
    @invent_transaction.destroy

    respond_to do |format|
      format.html { redirect_to invent_transactions_url }
      format.json { head :no_content }
    end
  end
end
