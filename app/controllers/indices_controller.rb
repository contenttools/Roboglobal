class IndicesController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token, only: [:download_eu_factsheet]

  before_action :set_index, only: [:show, :edit, :update, :destroy, :remove_file]

  def us_index
    session[:referrer_index] = "us"
    @indices = Index.index_type(session[:referrer_index]).page params[:page]
    render :index
  end

  def eu_index
    session[:referrer_index] = "eu"
    @indices = Index.index_type(session[:referrer_index]).page params[:page]
    render :index
  end

  # GET /indices/1
  # GET /indices/1.json
  def show
    @pdf_attachment = @index.pdf_attachment
  end

  # GET /indices/new
  def new
    @index = Index.new
    initialize_variables
  end

  # GET /indices/1/edit
  def edit
    initialize_variables
  end

  # POST /indices
  # POST /indices.json
  def create
    @index = Index.new(index_params)

    @pdf_attachment = params[:attached_file_id].present? ? PdfAttachment.find(params[:attached_file_id]) : nil
    @index.pdf_attachment = @pdf_attachment if @pdf_attachment.present?
    @index.index_type = session[:referrer_index] if session[:referrer_index].present?

    respond_to do |format|
      if @index.save
        format.html { redirect_to get_return_path, notice: 'Index ' + session[:referrer_index].titleize + ' was successfully created.' }
        format.json { render :show, status: :created, location: @index }
      else
        initialize_variables
        flash.now[:error] = @index.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @index.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /indices/1
  # PATCH/PUT /indices/1.json
  def update
    @pdf_attachment = params[:attached_file_id].present? ? PdfAttachment.find(params[:attached_file_id]) : nil
    @index.pdf_attachment = @pdf_attachment if @pdf_attachment.present?
    @index.index_type =  session[:referrer_index] if session[:referrer_index].present?

    respond_to do |format|
      if @index.update(index_params)
        format.html { redirect_to get_return_path, notice: 'Index ' + session[:referrer_index].titleize + ' was successfully updated.' }
        format.json { render :show, status: :ok, location: @index }
      else
        initialize_variables
        flash.now[:error] = @index.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @index.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indices/1
  # DELETE /indices/1.json
  def destroy
    @index.file_correlation.destroy if @index.file_correlation.present?
    @index.destroy
    respond_to do |format|
      format.html { redirect_to get_return_path, notice: 'Index ' + session[:referrer_index].titleize + ' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_file
    @index.file_correlation.destroy if @index.file_correlation.present?
    render nothing: true
  end

  def download_eu_factsheet
    @index = Index.new
    begin
      @pdf_attachment = PdfAttachment.new(document: params[:attachments]['0']) if params[:attachments].present?
      @index.pdf_attachment = @pdf_attachment if @pdf_attachment.present?
      @index.index_type =  "eu"
      @index.category = "fact_sheet"
      if @index.save
        render text: 'success', status: 200
      else
        render text: @index.errors.full_messages.to_sentence, status: 422
      end
    rescue Exception => e
       Rails.logger.info params
       Rails.logger.info e
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_index
      @index = Index.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def index_params
      params.require(:index).permit(:index_type, :category)
    end

    def initialize_variables
      if request.format.html?
        @current_pdf_attachment = @index.pdf_attachment
        @pdf_attachment = PdfAttachment.new
        @index.category = params[:category] if params[:category].present?
      end
      category = params[:category].present? ? params[:category] : @index.category
      @pdf_attachments = Index.index_type(session[:referrer_index]).category(category).page params[:page_doc]
    end

    def get_return_path
      session[:referrer_index] == "eu" ? eu_index_indices_path : us_index_indices_path
    end

end