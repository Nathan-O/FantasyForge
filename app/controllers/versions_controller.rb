class VersionsController < ApplicationController
   before_action :logged_in?

   def new
      id = params[:id]
      @map = Map.find(id)
      @creator = User.find(@map.user_id)
      @editor = current_user
      @version = Version.new
      render :new
   end

   def create
      @user = current_user
      mapTitle = (params[:title])
      @map = Map.find_by :title => mapTitle

      sub_title = params[:subtitle].split(' ').join("-")

      versionInfo = {
               :title => params[:title],
               :subtitle => sub_title,
               :url => params[:url]
               }
      @version = Version.new(versionInfo)

      if @version.save
         puts ("VERSION SAVED!!!!!")
         @map.versions << @version
         respond_to do |format|
            format.json do
               render :json => {
               :status => :redirect,
               :to => "/maps/#{@map.id}"
               }.to_json
            end
         end
      else
         render :new
      end
   end

end
