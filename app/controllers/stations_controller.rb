class StationsController < ApplicationController
  def create
    @station = Station.create(params[:station])
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def show
  end
end
