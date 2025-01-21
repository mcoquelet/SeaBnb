class IslandsController < ApplicationController
  def index
    @islands = Island.all
  end
end
