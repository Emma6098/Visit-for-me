class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id]) || current_user
    @review = Review.new(user: @user)
    @reviews = @user.reviews

    total_rating = @user.received_reviews.sum(&:rating)
    @average_rating = total_rating.to_f / @user.received_reviews.count
  end
end
