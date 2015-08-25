class PdfAttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pdf_attachment, only: [:show, :edit, :update, :destroy]

  # GET /pdf_attachments
  # GET /pdf_attachments.json
  def index
    @pdf_attachments = PdfAttachment.page params[:page]
  end

  # GET /pdf_attachments/1
  # GET /pdf_attachments/1.json
  def show
  end

  # GET /pdf_attachments/new
  def new
    @pdf_attachment = PdfAttachment.new
  end

  # GET /pdf_attachments/1/edit
  def edit
  end

  # POST /pdf_attachments
  # POST /pdf_attachments.json
  def create
    @pdf_attachment = PdfAttachment.new(pdf_attachment_params)

    respond_to do |format|
      if @pdf_attachment.save
        @url = @pdf_attachment.document.url(:pdf_mini)
        format.html { redirect_to @pdf_attachment, notice: 'File was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.json { render json: @pdf_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pdf_attachments/1
  # PATCH/PUT /pdf_attachments/1.json
  def update
    respond_to do |format|
      if @pdf_attachment.update(pdf_attachment_params)
        format.html { redirect_to @pdf_attachment, notice: 'File was successfully updated.' }
        format.json { render :show, status: :ok, location: @pdf_attachment }
      else
        format.html { render :edit }
        format.json { render json: @pdf_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf_attachments/1
  # DELETE /pdf_attachments/1.json
  def destroy
    @pdf_attachment.destroy
    respond_to do |format|
      format.html { redirect_to pdf_attachments_url, notice: 'File was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf_attachment
      @pdf_attachment = PdfAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pdf_attachment_params
      params.require(:pdf_attachment).permit(:document)
    end
end
