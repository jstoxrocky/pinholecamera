class CamerasController < ApplicationController
  def index
    cameras = Camera.all
    render json: cameras
  end

  def show
    camera = Camera.find(params[:id])
    render json: [camera]
  rescue ActiveRecord::RecordNotFound
    render json: []
  end

  def create
    camera = Camera.new(camera_params)
    camera.save
    render json: [camera]
  rescue NoMethodError
    render json: []
  end

  def destroy
    camera = Camera.find(params[:id])
    camera.destroy
    cameras = Camera.all
    render json: cameras
  end

  private

  def camera_params
    params.require(:camera).permit(:pinhole_diameter)
  end
end
