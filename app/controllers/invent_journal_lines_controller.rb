class InventJournalLinesController < ApplicationController
  # TODO remove sleeps
  # GET /invent_journal_lines
  # GET /invent_journal_lines.json
  def index
    sleep 1
    @invent_journal_lines = InventJournalLine.where(:journal_id => params[:journal_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invent_journal_lines }
    end
  end

  # GET /invent_journal_lines/1
  # GET /invent_journal_lines/1.json
  def show
    @invent_journal_line = InventJournalLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invent_journal_line, include: :dimension }
    end
  end

  # GET /invent_journal_lines/new
  # GET /invent_journal_lines/new.json
  def new
    @invent_journal_line = InventJournalLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invent_journal_line }
    end
  end

  # GET /invent_journal_lines/1/edit
  def edit
    @invent_journal_line = InventJournalLine.find(params[:id])
  end

  # POST /invent_journal_lines
  # POST /invent_journal_lines.json
  def create
    journal = InventJournal.find(params[:invent_journal_line][:journal_id])

    #raise "Journal #{journal} #{params[:invent_journal_line]}" #if journal.nil?

    @invent_journal_line = journal.lines.build(params[:invent_journal_line])

    #raise "#{@invent_journal_line} #{ @invent_journal_line.valid?} #{ @invent_journal_line.inspect}"

    respond_to do |format|
      if @invent_journal_line.save
        format.html { redirect_to @invent_journal_line, notice: 'Invent journal line was successfully created.' }
        format.json { render json: @invent_journal_line, status: :created, location: @invent_journal_line }
      else
        format.html { render action: "new" }
        format.json { render json: @invent_journal_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invent_journal_lines/1
  # PUT /invent_journal_lines/1.json
  def update
    @invent_journal_line = InventJournalLine.find(params[:id])

    respond_to do |format|
      if @invent_journal_line.update_attributes(params[:invent_journal_line])
        format.html { redirect_to @invent_journal_line, notice: 'Invent journal line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invent_journal_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invent_journal_lines/1
  # DELETE /invent_journal_lines/1.json
  def destroy
    @invent_journal_line = InventJournalLine.find(params[:id])
    @invent_journal_line.destroy

    respond_to do |format|
      format.html { redirect_to invent_journal_lines_url }
      format.json { head :no_content }
    end
  end
end
