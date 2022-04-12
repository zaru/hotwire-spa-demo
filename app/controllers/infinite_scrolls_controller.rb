class InfiniteScrollsController < ApplicationController
  InfiniteItem = Struct.new(:id, :name, :description)
  def show
    @page = params[:page]&.to_i || 1
    min = (@page - 1) * 10 + 1
    max = min + 9
    @infinite_items = (min..max).map { |i| InfiniteItem.new(i, "ItemName #{i}", "description #{i}. " * 50) }
  end
end
