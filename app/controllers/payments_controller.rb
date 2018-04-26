class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.order(ends_at: :asc).page(params[:page])
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    # redirect_to action: 'create'
    create
  end




  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new
    last_datetime  = Payment.maximum('ends_at')

    next_payment_datetime = form_next_payment_datetime(last_datetime)

    @payment.starts_at = next_payment_datetime
    @payment.ends_at = form_next_payment_datetime(next_payment_datetime) - 1.day

    @payment.user = current_user

    if !@payment.save!
      return redirect_to payments_path, alert:  "Payment can't be saved for unknown fucking reason!"
    end

    # redirect_to payments_path, notice:  "Payment was successfully created!"

    redirect_back fallback_location: { action: "index"}, notice: "Payment was successfully created!"
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: { action: "index"}, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:starts_at, :ends_at, :user_id)
    end

    def form_next_payment_datetime(last_datetime)
      allowed_datetimes = form_allowed_datetimes(last_datetime)

      next_payment_datetime = nil

      for datetime in allowed_datetimes
        if(datetime > last_datetime)
          next_payment_datetime = datetime
          break
        end
      end

      return next_payment_datetime
    end

    def form_allowed_datetimes(last_datetime)
      allowed_datetimes = []

      first_payment_day = Rails.configuration.x.payment.first_day
      second_payment_day = Rails.configuration.x.payment.second_day

      temp_datetime = last_datetime

      allowed_datetimes.push DateTime.new(temp_datetime.year, temp_datetime.month, first_payment_day)
      allowed_datetimes.push DateTime.new(temp_datetime.year, temp_datetime.month, second_payment_day)

      temp_datetime += 1.month

      allowed_datetimes.push DateTime.new(temp_datetime.year, temp_datetime.month, first_payment_day)
      allowed_datetimes.push DateTime.new(temp_datetime.year, temp_datetime.month, second_payment_day)

      return allowed_datetimes
    end
end
