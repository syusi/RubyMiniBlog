class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # GET /replies
  # GET /replies.json
  def index
  	@blog = Blog.find(params[:id])
    @replies = @blog.replie
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
  	@blog = Blog.find(@reply.blog_id)
  end

  # GET /replies/new
  def new
    @reply = Replie.new
	@blog = Blog.find(params[:id])
	@reply.update(:blog_id => params[:id])
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Replie.new(reply_params)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @reply, notice: 'Replie was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: 'Replie was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Replie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Replie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:replie).permit(:blog_id, :comment)
    end
end
