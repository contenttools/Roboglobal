class PageEmbedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page_embed, only: :update

  def index
    @page_embeds = PageEmbed.all
  end

  def update
    respond_to do |format|
      if @page_embed.update(page_embed_params)
        format.html { redirect_to page_embeds_path, notice: 'Entity successfully updated.' }
        format.json { render :show, status: :ok, location: @page_embed }
      else
        format.html { redirect_to page_embeds_path, alert: @page_embed.errors.full_messages.to_sentence }
        format.json { render json: @page_embed.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def page_embed_params
      params.require(:page_embed).permit(:title, :description, :embed_code)
    end

    def set_page_embed
      @page_embed = PageEmbed.find(params[:id])
    end
end
