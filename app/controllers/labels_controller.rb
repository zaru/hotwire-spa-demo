class LabelsController < ApplicationController
  def new; end

  def create
    @label = Label.find_or_initialize_by(title: params[:label][:title])
    @item_label = @label.item_labels.build(item_id: params[:label][:item_labels_attributes]['0'][:item_id])

    respond_to do |format|
      if @label.save
        format.turbo_stream { flash.now[:notice] = '追加しました' }
        format.html { redirect_to @label, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @label }
      else
        format.turbo_stream do
          flash.now[:notice] = 'すでに追加済みです'
          # MEMO: なぜか render nothing だと create.turbo_stream がレンダリングされてしまう
          render :error, status: :unprocessable_entity
        end
        format.html { render :error, status: :unprocessable_entity }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def label_params
    params.require(:label).permit(:title, item_labels_attributes: [:item_id])
  end
end
