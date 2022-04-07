class ItemLabelsController < ApplicationController
  def create
    @item_label = ItemLabel.new(item_label_params)

    respond_to do |format|
      if @item_label.save
        format.turbo_stream { flash.now[:notice] = '追加しました' }
        format.html { redirect_to @item_label, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @item_label }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_label.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_label = ItemLabel.find(params[:id])
    @item_label.destroy
    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = '削除しました' }
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def item_label_params
    params.require(:item_label).permit(:item_id, :label_id)
  end
end
