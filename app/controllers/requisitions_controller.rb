class RequisitionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_requisition, :only=>[:show, :edit, :update, :destroy]
  # GET  /requisitions
  # GET /requisitions.xml
  def index
    unless params[:query].blank?
      date = DateTime.now;
      unless params[:query][:year].blank?
        unless params[:query][:month] .blank?
          date = DateTime.parse(params[:query][:year]+'-'+params[:query][:month]+'-'+"1")
        else
          date = DateTime.parse(params[:query][:year]+'-'+"12"+'-'+"1")
        end
      else
        unless params[:query][:month].blank?
          date = DateTime.parse(DateTime.now.year+'-'+params[:query][:month]+'-'+"1")
        else
          date = DateTime.now
        end
      end

      conditions =[]
      parameters =[]
      conditions << "borrowed_at <= ?"
      parameters << date

      unless params[:query][:req_id].blank?
        conditions << "req_id like ?"
        parameters << '%'+params[:query][:req_id]+'%'
      end

      unless params[:query][:reason].blank?
        conditions << "reason_id = ?"
        parameters << params[:query][:reason]
      end

      unless params[:query][:borrower].blank?
        conditions << "borrower_id = ?"
        parameters << params[:query][:borrower]
      end
      unless params[:query][:category].blank?
        conditions << "category_id = ?"
        parameters << params[:query][:category]
      end

      conditions = [ conditions.join(" AND ") , *parameters ]

      @requisitions = Requisition.where(conditions).includes(:reason, :category, :borrower)
      @requisitions_count1 = @requisitions.count
      @requisitions = @requisitions.page params[:page]
    else
      @requisitions = Requisition.mark_as_not_cleared.includes(:reason, :category, :borrower)
      @requisitions_count1 = @requisitions.count
      @requisitions = @requisitions.page params[:page]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requisitions }
    end
  end

  # GET /requisitions/1
  # GET /requisitions/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @requisition }
    end
  end

  # GET /requisitions/new
  # GET /requisitions/new.xml
  def new
    @requisition = Requisition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @requisition }
    end
  end

  # GET /requisitions/1/edit
  def edit
  end

  # POST /requisitions
  # POST /requisitions.xml
  def create
    @requisition = Requisition.new(params[:requisition])

    respond_to do |format|
      if @requisition.save
        format.html { redirect_to(@requisition, :notice => 'Requisition was successfully created.') }
        format.xml  { render :xml => @requisition, :status => :created, :location => @requisition }
      else
        format.html { render "new" }
        format.xml  { render :xml => @requisition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requisitions/1
  # PUT /requisitions/1.xml
  def update

    respond_to do |format|
      if @requisition.update_attributes(params[:requisition])
        format.html { redirect_to(@requisition, :notice => 'Requisition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render "edit" }
        format.xml  { render :xml => @requisition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requisitions/1
  # DELETE /requisitions/1.xml
  def destroy
    @requisition.destroy

    respond_to do |format|
      format.html { redirect_to(requisitions_url) }
      format.xml  { head :ok }
    end
  end

  def find_requisition
    @requisition = Requisition.find(params[:id])
  end

  def in_stock
    @requisitions = Requisition.in_stock.includes(:reason, :category, :borrower)
  end

  def not_in_stock
     @requisitions = Requisition.not_in_stock.includes(:reason, :category, :borrower)
  end

  def money_returned
      @requisitions = Requisition.money_returned.includes(:reason, :category, :borrower)
  end

  def money_not_returned
    @requisitions = Requisition.money_not_returned.includes(:reason, :category, :borrower)
  end

  def mark_as_cleared
    @requisitions = Requisition.mark_as_cleared.includes(:reason, :category, :borrower)
  end

  def mark_as_not_cleared
      @requisitions = Requisition.mark_as_not_cleared.includes(:reason, :category, :borrower)
  end

  def all
     @requisitions = Requisition.includes(:reason, :category, :borrower)
  end

end
