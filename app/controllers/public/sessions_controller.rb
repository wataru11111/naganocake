class Public::SessionsController < ApplicationController
  def new
  end

  def create

  end

  def destroy
    @model_class_name = ModelClassName.find(params[:id])
    @model_class_name.destroy

    respond_to do |wants|
      wants.html { redirect_to(model_class_names_url) }
      wants.xml  { head :ok }
  end

  end
end
