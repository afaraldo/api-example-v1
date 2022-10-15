class ArreglosController < ApplicationController

  # GET /arreglos
  def index
    size = params[:size] ? params[:size].to_i : 0

    if size < 10
      result = {error: "size should be great than 10"}
    else
      set = Set.new
      while set.length < size do
        set.add(rand(0..30))
      end

      result = set.to_a # Initialize array with element from 0 to 30
    end

    render json: result
  end

end
