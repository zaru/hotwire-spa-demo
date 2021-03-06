class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles or /articles.json
  def index
    @articles = Article.all.order(id: :desc).page(params[:page]).per(5)
  end

  # GET /articles/1 or /articles/1.json
  def show
    render 'show_frame' if turbo_frame_request?
  end

  # GET /articles/new
  def new
    @article = Article.new
    render 'new_frame' if turbo_frame_request?
  end

  # GET /articles/1/edit
  def edit
    render 'edit_frame' if turbo_frame_request?
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    # MEMO: ボタン submitting の描画を見せるためにスリープさせている
    sleep 0.25

    respond_to do |format|
      if @article.save
        format.turbo_stream do
          flash.now[:notice] = '追加しました'
        end
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.turbo_stream do
          flash.now[:notice] = '更新しました'
        end
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.turbo_stream do
        flash.now[:notice] = '削除しました'
      end
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
