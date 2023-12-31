class SubscriptionHistoriesController < ApplicationController
  before_action :set_subscription_history, only: %i[ show edit update destroy ]
  before_action :authorize

  # GET /subscription_histories or /subscription_histories.json
  def index
    # @subscription_histories = SubscriptionHistory.all
    if params[:search]
      @subscription_histories = SubscriptionHistory.search(params[:search]).order('created_at desc')      
    elsif params[:uid]
      user = User.find(params[:uid].to_i)
      @subscription_histories = user.subscription_histories.order("created_at desc")      
    else
      #@subscription_histories = SubscriptionHistory.where("created_at >= ?", Date.today).order('created_at desc')
      @subscription_histories = SubscriptionHistory.all.order('created_at desc')
    end
    # .paginate(:page => params[:page], :per_page => PER_PAGE)
  end

  # GET /subscription_histories/1 or /subscription_histories/1.json
  def show
  end

  # GET /subscription_histories/new
  def new
    @subscription_history = SubscriptionHistory.new
  end

  # GET /subscription_histories/1/edit
  def edit
  end

  # POST /subscription_histories or /subscription_histories.json
  def create
    @subscription_history = SubscriptionHistory.new(subscription_history_params)

    respond_to do |format|
      if @subscription_history.save
        format.html { redirect_to subscription_history_url(@subscription_history), notice: "Subscription history was successfully created." }
        format.json { render :show, status: :created, location: @subscription_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscription_histories/1 or /subscription_histories/1.json
  def update
    respond_to do |format|
      if @subscription_history.update(subscription_history_params)
        format.html { redirect_to subscription_history_url(@subscription_history), notice: "Subscription history was successfully updated." }
        format.json { render :show, status: :ok, location: @subscription_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscription_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_histories/1 or /subscription_histories/1.json
  def destroy
    @subscription_history.destroy

    respond_to do |format|
      format.html { redirect_to subscription_histories_url, notice: "Subscription history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_history
      @subscription_history = SubscriptionHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_history_params
      params.require(:subscription_history).permit(:user_id, :subscription_id, :subscription_start, :subscription_end, :coupon_id)
    end
end
