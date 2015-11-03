class VersionsController < ApplicationController
   before_action :logged_in?

   def new
      id = params[:id]
      @map = Map.find(id)

      # puts ("The Master Map URL = #{@map.url}")

      @creator = User.find(@map.user_id)
      @editor = current_user
      @version = Version.new
      render :new
   end

   def create
      #subId = params[:submission_id]
      # puts params
      @user = current_user

      # versionInfo = params.require(:edit).permit(:notes, :line_edits, :user_id, :submission_id)
      # subId = params[:map_id]

      # mapTitle = (params[:title].strip)
      mapTitle = (params[:title])

      @map = Map.find_by :title => mapTitle

      sub_title = params[:subtitle].split(' ').join("-")
      # sub_title = sub_title.join("-")

      puts("!!!!! *** Map *** !!!!!")
      puts @map.title
      puts("!!!!! *** Sub Title *** !!!!!")

      puts sub_title

      puts("After Map...")

      # puts("!!!!! *** !!!!! MAP:")
      # puts @map.title
      # puts("After Map...")

      # map_data = params[:url]
      # image_data = Base64.decode64(map_data['data:image/png;base64,'.length .. -1])
      #
      # puts image_data
      versionInfo = {
               :title => params[:title],
               :subtitle => sub_title,
               :url => params[:url]
               }
      # puts versionInfo


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
      # check
   end


   def show
   end

end
