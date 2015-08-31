class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :robo_news]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy, :remove_image, :remove_file, :remove_video]
  before_action :set_subscriber, only: [:show, :robo_news]
  before_action :set_token, only: :robo_news

  # GET /blog_posts
  # GET /blog_posts.json
  def index
    @blog_posts = BlogPost.page params[:page]
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.json
  def show
    BlogPost.update_counters(@blog_post.id, views: 1)
    @archives = BlogPost.archives_list
  end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new if request.format.html?
    initialize_new_variables
  end

  # GET /blog_posts/1/edit
  def edit
    initialize_edit_variables
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @blog_post = BlogPost.new(blog_post_params)
    @attachment = params[:attached_image_id].present? ? Attachment.find(params[:attached_image_id]) : nil
    @pdf_attachment = params[:attached_file_id].present? ? PdfAttachment.find(params[:attached_file_id]) : nil
    @embedded_attachment = params[:attached_video_id].present? ? EmbeddedAttachment.find(params[:attached_video_id]) : nil

    respond_to do |format|
      if @blog_post.save

        @blog_post.attachment = @attachment if @attachment.present?
        @blog_post.pdf_attachment = @pdf_attachment if @pdf_attachment.present?
        @blog_post.embedded_attachment = @embedded_attachment if @embedded_attachment.present?

        format.html { redirect_to blog_posts_path, notice: 'Blog post was successfully created.' }
        format.json { render :show, status: :created, location: @blog_post }
      else
        initialize_new_variables
        flash.now[:error] = @blog_post.errors.full_messages.to_sentence
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
    @embedded_attachment = params[:attached_video_id].present? ? EmbeddedAttachment.find(params[:attached_video_id]) : nil

    respond_to do |format|
      if @blog_post.update(blog_post_params)

        @blog_post.attachment = @attachment if @attachment.present?
        @blog_post.pdf_attachment = @pdf_attachment if @pdf_attachment.present?
        @blog_post.embedded_attachment = @embedded_attachment if @embedded_attachment.present?

        format.html { redirect_to blog_posts_path, notice: 'Blog post was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        initialize_edit_variables
        flash.now[:error] = @blog_post.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    @blog_post.image_correlation.destroy if @blog_post.image_correlation.present?
    @blog_post.file_correlation.destroy if @blog_post.file_correlation.present?
    @blog_post.video_correlation.destroy if @blog_post.video_correlation.present?
    @blog_post.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url, notice: 'Blog post was successfully deleted.' }
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

  def remove_video
    @blog_post.video_correlation.destroy if @blog_post.video_correlation.present?
    render nothing: true
  end

  def robo_news
    @latest_blogs = BlogPost.includes(:attachment, :pdf_attachment).where("tags LIKE ?", "%#{@token}\n%").published_ordered.ordered.first(6)
    @archives = BlogPost.archives_list
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      begin
        @blog_post = BlogPost.find(params[:id])
      rescue
        render file: "#{Rails.root}/public/404", layout: false, status: :not_found
        return false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :description, :published_date, :views, {:tags => []})
    end

    def initialize_new_variables
      if request.format.html?
        @attachment = Attachment.new

        @current_pdf_attachment = @blog_post.pdf_attachment
        @pdf_attachment = PdfAttachment.new

        @current_embedded_attachment = @blog_post.embedded_attachment
        @embedded_attachment = EmbeddedAttachment.new
      end
      @attachments = Attachment.page(params[:page]).per(10)
      @pdf_attachments = PdfAttachment.page(params[:page_doc]).per(10)
      @embedded_attachments = EmbeddedAttachment.page(params[:page_vid]).per(10)
    end

    def initialize_edit_variables
      if request.format.html?
        @current_attachment = @blog_post.attachment
        @attachment = Attachment.new

        @current_pdf_attachment = @blog_post.pdf_attachment
        @pdf_attachment = PdfAttachment.new

        @current_embedded_attachment = @blog_post.embedded_attachment
        @embedded_attachment = EmbeddedAttachment.new
      end
      @attachments = Attachment.page(params[:page]).per(10)
      @pdf_attachments = PdfAttachment.page(params[:page_doc]).per(10)
      @embedded_attachments = EmbeddedAttachment.page(params[:page_vid]).per(10)
    end

    def set_subscriber
      @subscriber = Subscriber.new
    end

    def set_token
      if params[:token].present? && params[:token].in?(BlogPost::TOKENS)
        @token = params[:token]
      elsif params[:token].present? && !(params[:token].in?(BlogPost::TOKENS))
        flash[:error] = "Invalid Token provided."
        redirect_to robo_news_path
      else
        @token = ''
      end
    end
end
