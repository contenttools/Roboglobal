class EmbeddedAttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_embedded_attachment, only: [:show, :edit, :update, :destroy]

  # GET /embedded_attachments
  # GET /embedded_attachments.json
  def index
    @embedded_attachments = EmbeddedAttachment.page params[:page]
  end

  # GET /embedded_attachments/1
  # GET /embedded_attachments/1.json
  def show
  end

  # GET /embedded_attachments/new
  def new
    @embedded_attachment = EmbeddedAttachment.new
  end

  # GET /embedded_attachments/1/edit
  def edit
  end

  # POST /embedded_attachments
  # POST /embedded_attachments.json
  def create
    @embedded_attachment = EmbeddedAttachment.new(embedded_attachment_params)

    respond_to do |format|
      if @embedded_attachment.save
        @url = @embedded_attachment.embed_code
        format.html { redirect_to @embedded_attachment, notice: 'Video was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.json { render json: @embedded_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /embedded_attachments/1
  # PATCH/PUT /embedded_attachments/1.json
  def update
    respond_to do |format|
      if @embedded_attachment.update(embedded_attachment_params)
        format.html { redirect_to @embedded_attachment, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @embedded_attachment }
      else
        format.html { render :edit }
        format.json { render json: @embedded_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /embedded_attachments/1
  # DELETE /embedded_attachments/1.json
  def destroy
    @embedded_attachment.destroy
    respond_to do |format|
      format.html { redirect_to embedded_attachments_url, notice: 'Video was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_embedded_attachment
      @embedded_attachment = EmbeddedAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def embedded_attachment_params
      params.require(:embedded_attachment).permit(:embed_code, :attachable_id, :attachable_type)
    end
end
