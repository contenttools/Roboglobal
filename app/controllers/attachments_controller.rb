class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @attachments = Attachment.page params[:page]
    respond_with(@attachments)
  end

  def show
    respond_with(@attachment)
  end

  def new
    @attachment = Attachment.new
    respond_with(@attachment)
  end

  def edit
  end

  def create
    @attachment = Attachment.new(attachment_params)
    respond_to do |format|
      if @attachment.save
        @url = @attachment.image.url(:thumb)
        format.html { redirect_to @attachment, notice: 'Attachment was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attachment.destroy
    respond_with(@attachment)
  end

  private
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    def attachment_params
      params.require(:attachment).permit(:image)
    end
end
