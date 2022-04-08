class LabelsController < ApplicationController
  def create
    @label = Label.new(label_params)

    respond_to do |format|
      if @label.save
        @item_label = @label.item_labels.first
        format.turbo_stream { flash.now[:notice] = '追加しました' }
        format.html { redirect_to @label, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @label }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def label_params
    params.require(:label).permit(:title, item_labels_attributes: [:item_id])
  end
end
