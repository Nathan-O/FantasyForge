class MapsController < ApplicationController

   def index
      @maps = Map.all
   end

   def new
      @map = Map.new
   end

   def create
   end



end
