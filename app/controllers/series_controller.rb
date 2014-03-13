class SeriesController < ApplicationController
  def search
    # TODO: replace with more sophisticated search
    @matches = GCD::GcdSeries.where('name like ?', "%#{params[:q]}%")
  end

  def list
  end

  def view
  end

  def follow
  end

  def unfollow
  end
end
