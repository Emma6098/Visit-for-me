class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id]) || current_user
    @review = Review.new(user: @user)
    @reviews = @user.reviews

    total_rating = @reviews.sum(&:rating)
    @average_rating = total_rating.to_f / @reviews.count
  end
end
