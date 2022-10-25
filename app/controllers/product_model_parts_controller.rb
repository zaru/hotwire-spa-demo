# TurboStream で、一括更新フォーム用の ProductModel フォームパーツを返す
class ProductModelPartsController < ApplicationController
  def create
    @product = Product.new
    @product.product_models.build
  end

  def destroy
    # 作成済みの場合は、そのオブジェクトを。未作成の場合は生成する
    @product = Product.find_by(id: params[:product_id]) || Product.new
    @product_model = @product.product_models.find_by(id: params[:product_model_id]) || @product.product_models.build
  end
end
