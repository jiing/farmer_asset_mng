class RequisitionsController < ApplicationController
  before_filter :authenticate_user! 
  # GET  /requisitions
  # GET /requisitions.xml
  def index
    unless params[:query].nil? 
      date_in_where='';
      if  ( params[:query][:borrowed_at][:year].blank? )                
        if ( params[:query][:borrowed_at][:month].blank?)
          date_in_where = "%"
        else
          date_in_where = '%-'+ sprintf("%02d",params[:query][:borrowed_at][:month])+'%'
        end
      else
        if ( params[:query][:borrowed_at][:month].blank?)
          date_in_where = '%'+params[:query][:borrowed_at][:year] +'-%'
        else
          date_in_where = '%'+params[:query][:borrowed_at][:year]+'-'+sprintf("%02d",params[:query][:borrowed_at][:month])+'%'
        end
      end    

      @requisitions = Requisition.where(["req_id like ? AND borrowed_at like ? AND reason_id like ? AND borrower_id like ? AND category_id like ?",
        ( params[:query][:req_id].blank?) ? ( '%' ):  ('%'+ params[:query][:req_id]+'%') ,
        date_in_where,
        ( params[:query][:reason].blank?) ? ( '%' ):  ('%'+ params[:query][:reason]+'%'),
        ( params[:query][:borrower].blank?) ? ( '%' ):  ('%'+ params[:query][:borrower]+'%'),
        ( params[:query][:category].blank?) ? ( '%' ):  ('%'+ params[:query][:category]+'%')]
        ).page params[:page]
      else
        @requisitions = Requisition.order(:req_id).mark_as_not_cleared.page params[:page]        
      end

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @requisitions }
      end
    end

  # GET /requisitions/1
  # GET /requisitions/1.xml
  def show
    @requisition = Requisition.find(params[:id])

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
    @requisition = Requisition.find(params[:id])
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
        format.html { render :action => "new" }
        format.xml  { render :xml => @requisition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requisitions/1
  # PUT /requisitions/1.xml
  def update
    @requisition = Requisition.find(params[:id])

    respond_to do |format|
      if @requisition.update_attributes(params[:requisition])
        format.html { redirect_to(@requisition, :notice => 'Requisition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @requisition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requisitions/1
  # DELETE /requisitions/1.xml
  def destroy
    @requisition = Requisition.find(params[:id])
    @requisition.destroy

    respond_to do |format|
      format.html { redirect_to(requisitions_url) }
      format.xml  { head :ok }
    end
  end
  
  def in_stock
    @requisitions = Requisition.in_stock
    respond_to do |format|
      format.html # in_stock.html.erb
      format.xml  { render :xml => @requisition }
    end
  end 
  
  def not_in_stock
     @requisitions = Requisition.not_in_stock
  end
  
  def money_returned
      @requisitions = Requisition.money_returned
  end
  
  def money_not_returned
    @requisitions = Requisition.money_not_returned    
  end
  
  def mark_as_cleared
    @requisitions = Requisition.mark_as_cleared 
  end
  
  def mark_as_not_cleared
      @requisitions = Requisition.mark_as_not_cleared 
  end
  
  def all
     @requisitions = Requisition.all
  end
  
end
