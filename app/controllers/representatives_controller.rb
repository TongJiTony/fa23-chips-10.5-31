# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end

  def show
    @id = params[:id]
    if Representative.exists?(id: @id)
      @representative = Representative.find params[:id]
    else
      redirect_to representatives_path
    end
  end
end
