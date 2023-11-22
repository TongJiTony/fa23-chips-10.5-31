# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end
  def show
    @representative = Representative.find params[:id]
    unless @representative
      redirect_to representatives_path
    end
  end
end
