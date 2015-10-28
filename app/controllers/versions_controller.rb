class VersionsController < ApplicationController
   before_action :logged_in?

   def new
      id = params[:id]
      @map = Map.find(id)

      puts ("The Master Map URL = #{@map.url}")

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
      mapTitle = (params[:title].strip)

      @map = Map.find_by :title => mapTitle

      puts("!!!!! *** !!!!! MAP:")
      puts @map.title
      puts("After Map...")

      # map_data = params[:url]
      # image_data = Base64.decode64(map_data['data:image/png;base64,'.length .. -1])
      #
      # puts image_data
      versionInfo = {
               :title => params[:title],
               :subtitle => params[:subtitle],
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



#
# mapInfo = {
#          :title => params[:title],
#          :subtitle => "Master",
#          :url => params[:url]
#          }
# puts mapInfo
# @map = Map.new(mapInfo)
# @user = current_user

# if @map.save
#    puts ("SAVED!!!!!")
#    @user.maps << @map
#    respond_to do |format|
#       format.json do
#          render :json => {
#          :status => :redirect,
#          :to => "/maps/#{@map.id}"
#          }.to_json
#       end
#    end
# end



#
# before_action :logged_in?, only: [:new]
# require "differ"
#
# def new
#    id = params[:id]
#    @submission = Submission.find(id)
#    author = User.find(@submission.user_id)
#    @editor = current_user
#    @edit = Edit.new
#    render :new
# end
#
# def create
#
#    #subId = params[:submission_id]
#    @user = current_user
#    editInfo = params.require(:edit).permit(:notes, :line_edits, :user_id, :submission_id)
#    subId = editInfo[:submission_id]
#    @submission = Submission.find(subId)
#    # p editInfo[:line_edits]
#    #
#    @story = @submission.content
#    @edit = editInfo[:line_edits]
#    #
#    # edit_paragraphs = edit.split('<br />')
#    # story_paragraphs = story.split(/[\n]/)
#    #
#    # p edit_paragraphs
#    # p story_paragraphs
#    Differ.format = :color
#    @diff = Differ.diff_by_word(@edit, @story)
#    #@diff.format_as(:color)
#    p @diff
#    editInfo[:notes] = @diff
#    @edit = Edit.new(editInfo)
#    if @edit.save
#       redirect_to "/submissions/#{@submission.id}"
#    else
#       render :new
#    end
# end
#
# def show
#    @edit = Edit.find(params[:id])
#    @submission = @edit.submission
#    author = @submission.user
#    @editor = @edit.user
# end
