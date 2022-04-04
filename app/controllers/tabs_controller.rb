class TabsController < ApplicationController

  # GET /tabs or /tabs.json
  def index
    render "index_#{params[:id] || 1}"
  end
end
