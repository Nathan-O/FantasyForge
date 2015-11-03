class MapsController < ApplicationController
   require 'base64'

    before_action :logged_in?, only: [:new]

   def index
      @maps = Map.all
      render :index
   end

   def new
      @map = Map.new
   end

   def create
      map_data = params[:url]
      mapInfo = {
               :title => params[:title],
               :subtitle => "Master",
               :url => map_data
               }
      puts mapInfo
      @map = Map.new(mapInfo)
      @user = current_user

      if @map.save
         puts ("SAVED!!!!!")
         @user.maps << @map
         respond_to do |format|
            format.json do
               render :json => {
               :status => :redirect,
               :to => "/maps/#{@map.id}"
               }.to_json
            end
         end
      end

   end

   def show
      puts params
      @map = Map.find(params[:id].to_i)
      @creator = User.find(@map.user_id)
      @user = current_user
      render :show
   end



end
