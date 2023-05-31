class MailersController < ApplicationController
  before_action :set_mailer, only: %i[ show edit update destroy ]

  def index
    @mailers = Mailer.all
  end

  def show
  end

  def new
    @mailer = Mailer.new
  end

  def edit
  end

  def create
    @mailer = Mailer.new(mailer_params)

    respond_to do |format|
      if @mailer.save
        format.html { redirect_to mailer_url(@mailer), notice: "Mailer was successfully created." }
        format.json { render :show, status: :created, location: @mailer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mailer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mailer.update(mailer_params)
        format.html { redirect_to mailer_url(@mailer), notice: "Mailer was successfully updated." }
        format.json { render :show, status: :ok, location: @mailer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mailer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mailer.destroy

    respond_to do |format|
      format.html { redirect_to mailers_url, notice: "Mailer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_mailer
      @mailer = Mailer.find(params[:id])
    end

    def mailer_params
      params.require(:mailer).permit(:to, :subject, :body)
    end
end
