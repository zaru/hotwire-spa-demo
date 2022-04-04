class PagePreviewsController < ApplicationController
  # GET /page_previews
  def show
    @page = Page.new
  end

  # POST /page_previews
  def create
    @page = Page.new(title: params[:page][:title],
                     description: params[:page][:description],
                     color: params[:page][:color])
    @page.broadcast_replace_to("page_preview", target: 'page_preview', partial: 'pages/show_page')
  end
end
