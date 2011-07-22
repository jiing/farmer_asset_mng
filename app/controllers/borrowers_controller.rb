class BorrowersController < ApplicationController
  before_filter :authenticate_user! , :except => [ :show, :index ]
  # GET /borrowers
  # GET /borrowers.xml
  def index
    @borrowers = Borrower.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @borrowers }
    end
  end

  # GET /borrowers/1
  # GET /borrowers/1.xml
  def show
    @borrower = Borrower.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @borrower }
    end
  end

  # GET /borrowers/new
  # GET /borrowers/new.xml
  def new
    @borrower = Borrower.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @borrower }
    end
  end

  # GET /borrowers/1/edit
  def edit
    @borrower = Borrower.find(params[:id])
  end

  # POST /borrowers
  # POST /borrowers.xml
  def create
    @borrower = Borrower.new(params[:borrower])

    respond_to do |format|
      if @borrower.save
        format.html { redirect_to(@borrower, :notice => 'Borrower was successfully created.') }
        format.xml  { render :xml => @borrower, :status => :created, :location => @borrower }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @borrower.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /borrowers/1
  # PUT /borrowers/1.xml
  def update
    @borrower = Borrower.find(params[:id])

    respond_to do |format|
      if @borrower.update_attributes(params[:borrower])
        format.html { redirect_to(@borrower, :notice => 'Borrower was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @borrower.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /borrowers/1
  # DELETE /borrowers/1.xml
  def destroy
    @borrower = Borrower.find(params[:id])
    @borrower.destroy

    respond_to do |format|
      format.html { redirect_to(borrowers_url) }
      format.xml  { head :ok }
    end
  end
end
