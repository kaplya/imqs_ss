class InventJournalsController < ApplicationController
  # TODO Del sleeps

  # GET /invent_journals
  # GET /invent_journals.json
  def index
    sleep 1
    @invent_journals = InventJournal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invent_journals }
    end
  end

  # GET /invent_journals/1
  # GET /invent_journals/1.json
  def show
    @invent_journal = InventJournal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invent_journal }
    end
  end

  # GET /invent_journals/new
  # GET /invent_journals/new.json
  def new
    @invent_journal = InventJournal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invent_journal }
    end
  end

  # GET /invent_journals/1/edit
  def edit
    @invent_journal = InventJournal.find(params[:id])
  end

  # POST /invent_journals
  # POST /invent_journals.json
  def create
    sleep 1
    @invent_journal = InventJournal.new(params[:invent_journal])

    respond_to do |format|
      if @invent_journal.save
        format.html { redirect_to @invent_journal, notice: 'Invent journal was successfully created.' }
        format.json { render json: @invent_journal, status: :created, location: @invent_journal }
      else
        format.html { render action: "new" }
        format.json { render json: @invent_journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invent_journals/1
  # PUT /invent_journals/1.json
  def update
    sleep 1
    @invent_journal = InventJournal.find(params[:id])

    respond_to do |format|
      if @invent_journal.update_attributes(params[:invent_journal])
        format.html { redirect_to @invent_journal, notice: 'Invent journal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invent_journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invent_journals/1
  # DELETE /invent_journals/1.json
  def destroy
    sleep 1
    @invent_journal = InventJournal.find(params[:id])
    @invent_journal.destroy

    respond_to do |format|
      format.html { redirect_to invent_journals_url }
      format.json { head :no_content }
    end
  end
end
