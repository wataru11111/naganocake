class Admin::ItemsController < ApplicationController
  def new
  end

  def create
    @model_class_name = ModelClassName.new(params[:model_class_name])

    respond_to do |wants|
      if @model_class_name.save
        flash[:notice] = 'ModelClassName was successfully created.'
        wants.html { redirect_to(@model_class_name) }
        wants.xml  { render :xml => @model_class_name, :status => :created, :location => @model_class_name }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @model_class_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    @model_class_name = ModelClassName.find(params[:id])

    respond_to do |wants|
      if @model_class_name.update_attributes(params[:model_class_name])
        flash[:notice] = 'ModelClassName was successfully updated.'
        wants.html { redirect_to(@model_class_name) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @model_class_name.errors, :status => :unprocessable_entity }
      end
    end
  end

end
