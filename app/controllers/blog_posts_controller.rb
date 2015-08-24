class BlogPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy, :remove_image, :remove_file]

  # GET /blog_posts
  # GET /blog_posts.json
  def index
    @blog_posts = BlogPost.page params[:page]
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.json
  def show
  end

  # GET /blog_posts/new
  def new
    if request.format.html?
      @blog_post = BlogPost.new

      @current_attachment = Attachment.new
      @attachment = Attachment.new

      @current_pdf_attachment = PdfAttachment.new
      @pdf_attachment = PdfAttachment.new
    end
    @attachments = Attachment.page(params[:page]).per(10)
    @pdf_attachments = PdfAttachment.page(params[:page_doc]).per(10)
  end

  # GET /blog_posts/1/edit
  def edit
    if request.format.html?
      @current_attachment = @blog_post.attachment
      @attachment = Attachment.new

      @current_pdf_attachment = @blog_post.pdf_attachment
      @pdf_attachment = PdfAttachment.new
    end
    @attachments = Attachment.page(params[:page]).per(10)
    @pdf_attachments = PdfAttachment.page(params[:page_doc]).per(10)
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @blog_post = BlogPost.new(blog_post_params)
    @attachment = params[:attached_image_id].present? ? Attachment.find(params[:attached_image_id]) : nil
    @pdf_attachment = params[:attached_file_id].present? ? PdfAttachment.find(params[:attached_file_id]) : nil

    respond_to do |format|
      if @blog_post.save

        @blog_post.attachment = @attachment if @attachment.present?
        @blog_post.pdf_attachment = @pdf_attachment if @pdf_attachment.present?

        format.html { redirect_to @blog_post, notice: 'Blog post was successfully created.' }
        format.json { render :show, status: :created, location: @blog_post }
      else
        format.html { render :new }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_posts/1
  # PATCH/PUT /blog_posts/1.json
  def update
    @attachment = params[:attached_image_id].present? ? Attachment.find(params[:attached_image_id]) : nil
    @pdf_attachment = params[:attached_file_id].present? ? PdfAttachment.find(params[:attached_file_id]) : nil

    respond_to do |format|
      if @blog_post.update(blog_post_params)

        @blog_post.attachment = @attachment if @attachment.present?
        @blog_post.pdf_attachment = @pdf_attachment if @pdf_attachment.present?

        format.html { redirect_to @blog_post, notice: 'Blog post was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        format.html { render :edit }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    @blog_post.image_correlation.destroy
    @blog_post.file_correlation.destroy
    @blog_post.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_image
    @blog_post.image_correlation.destroy if @blog_post.image_correlation.present?
    render nothing: true
  end

  def remove_file
    @blog_post.file_correlation.destroy if @blog_post.file_correlation.present?
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :description, :published_date, :views, {:tags => []})
    end
end
