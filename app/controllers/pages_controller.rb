class PagesController < ApplicationController

  def index
    @pages = Page.base
  end

  def show
    @page = Page.find_by_slug(params[:slug])
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    if @page.save
      redirect_to(public_page_path(:slug => @page.slug), :notice => 'Page was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to public_page_path(:slug => @page.slug)
    else
      render :action => "edit"
    end
  end
  
  def sort
    Rails.logger.info params[:page].inspect
    params[:page].each_with_index do |id, index|
      Page.update_all(['position=?', index+1], ['id=?', id])
    end

    Rails.cache.clear
    render :nothing => true
  end  

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to(pages_url)
  end
end
