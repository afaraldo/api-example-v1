# Dynammic Array Controller
class DynamicArraysController < ApplicationController
  before_action :set_dynamic_array, only: %i[ show update destroy ]

  # GET /dynamic_arrays
  def index
    @dynamic_arrays = DynamicArray.all

    render json: @dynamic_arrays
  end

  # GET /dynamic_arrays/:id
  # To calcule
  def show
    result = GetLargestRange.call(array: @dynamic_array)
    if result.success?
      render json: result.range
    else
      render json: { error: result.error }, status: :unprocessable_entity
    end
  end

  # POST /dynamic_arrays
  def create
    result = CreateDynamicArray.call(dynamic_array_params)
    if result.success?
      render json: result.array, status: :created, location: result.array
    else
      render json: { error: result.error}, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dynamic_array
    @dynamic_array = DynamicArray.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dynamic_array_params
    params.require(:dynamic_array).permit(:length)
  end
end
