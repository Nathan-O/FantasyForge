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
      #subId = params[:submission_id]
      @user = current_user
      versionInfo = params.require(:edit).permit(:notes, :line_edits, :user_id, :submission_id)
      subId = editInfo[:submission_id]
      @map = Map.find(subId)

      @version = Version.new(versionInfo)
      if @version.save
         redirect_to "/maps/#{@map.id}"
      else
         render :new
      end
      # check
   end

   def show
   end

end
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
