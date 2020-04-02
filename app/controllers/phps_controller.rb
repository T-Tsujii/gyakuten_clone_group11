class PhpsController < ApplicationController
  def index
    @phps = Php.page(params[:page])
  end
end
