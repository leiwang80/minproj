class CategoriesItemsController < ApplicationController
  before_action :set_categories_item, only: [:show, :edit, :update, :destroy]

  # GET /categories_items
  # GET /categories_items.json
  def index
    @categories_items = CategoriesItem.all
  end

  # GET /categories_items/1
  # GET /categories_items/1.json
  def show
  end

  # GET /categories_items/new
  def new
    @categories_item = CategoriesItem.new
  end

  # GET /categories_items/1/edit
  def edit
  end

  # POST /categories_items
  # POST /categories_items.json
  def create
    @categories_item = CategoriesItem.new(categories_item_params)

    respond_to do |format|
      if @categories_item.save
        format.html { redirect_to @categories_item, notice: 'Categories item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @categories_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @categories_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories_items/1
  # PATCH/PUT /categories_items/1.json
  def update
    respond_to do |format|
      if @categories_item.update(categories_item_params)
        format.html { redirect_to @categories_item, notice: 'Categories item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @categories_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_items/1
  # DELETE /categories_items/1.json
  def destroy
    @categories_item.destroy
    respond_to do |format|
      format.html { redirect_to categories_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categories_item
      @categories_item = CategoriesItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categories_item_params
      params.require(:categories_item).permit(:category_id, :item_id)
    end
end
