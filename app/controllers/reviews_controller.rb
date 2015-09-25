class ReviewsController < ApplicationController
  before_filter :load_product
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @review = Review.find(params[:id])
  end

  def create

    # @review = Review.new(
    #   comment: params[:review][:comment],
    #   product_id: @product.id,
    #   user_id: current_user.id
    # )
    #alternative syntax

    @review = @product.reviews.build(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        #redirect_to products_path, notice: "Review created sucessfully"
        format.html { redirect_to product_path(@product.id), notice: "Review added."}
        format.js {} # This will look for app/views/reviews/create.js.erb
      else
        format.html { render 'products/show', alert: 'There was an error.' }
        format.js {}
        #render 'products/show'
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
