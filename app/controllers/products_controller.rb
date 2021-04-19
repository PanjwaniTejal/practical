class ProductsController < ApplicationController
  require 'fileutils'
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = current_user.products
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    respond_to do |format|
      if @product.save
        flash[:sucess] = 'Create Sucessfully'
        format.js
        format.json { render json: @product, status: 200 }
      else
        format.js { render 'new' }
        format.json { render json: @product, status: 500 }
      end
      @products = current_user.products
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:sucess] = 'Update Sucessfully'
    else
      flash[:error] = @product.errors.messages
    end
    @products = current_user.products
  end

  def destroy
    if @product.destroy
      flash[:sucess] = 'Delete Sucessfully'
    else
      flash[:error] = @product.errors.messages
    end
    @products = current_user.products
  end

  def import_data
    dir = File.join Rails.root, 'public', 'import_data'
    FileUtils.mkdir_p(dir) unless File.exist?(dir)

    file_name = params[:import_file].original_filename
    file = File.join("public/import_data", file_name)
    uploaded_file = params[:import_file]

    File.open(file, 'wb') do |file|
      file.write(uploaded_file.read)
    end

    # CSV upload into database using backgound job
    ImportCsvDataForProductJob.perform_later(file_name, current_user)
    redirect_to products_path
  end

  def search
    @products = if params[:search].present?
                  current_user.products.where('name LIKE ?', "%#{params[:search]}%")
                else
                  current_user.products
                end
  end

  private
  def set_product
    @product = current_user.products.find_by_id(params[:id])
    redirect_to root_path, error: 'Product not exist Or You are not allowed to access the product' unless @product.present?
  end

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

end
