# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :set_link, only: %i[show destroy]

  # GET /links or /links.json
  def index
    @links = Link.all
  end

  # GET /links/1 or /links/1.json
  def show
    @link.click
    redirect_to @link.original_url, allow_other_host: true
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links or /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to links_url, notice: 'Link was successfully created.' }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find_by!(short_url: params[:short_url])
  end

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:original_url)
  end
end
