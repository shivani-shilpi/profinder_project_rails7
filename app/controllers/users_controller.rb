class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.turbo_stream { render turbo_stream: turbo_stream.append('user_list', partial: 'users/user', locals: {user: @user})}
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('remote_modal', partial: 'users/modal', locals: {user: @user})}
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace("user_row_#{@user.id}", partial: 'users/user', locals: { user: @user })}
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('remote_modal', partial: 'users/modal', locals: {user: @user})}
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("user_row_#{@user.id}")}
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def fetch_country_states
    country = ISO3166::Country[params[:country_code]]
    @states = country.states.map { |state| [state.first, state[1].translations[I18n.locale.to_s]] }
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :city, :state, :country, :contact_number)
    end
end
