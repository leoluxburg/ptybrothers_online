class EventsController < ApplicationController
  before_action :set_rider, only: [:new, :create]
  def index
    @events = policy_scope(Event)
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    if @rider.user.admin
      @event = Event.new
      authorize @event
    else
      redirect_to root_path
    end
  end

  def create
    if @rider.user.admin
      @event = Event.create(event_params)
      @event.rider = current_user.rider
      authorize @event

      if @event.save
        redirect_to rider_path(@rider)
      else
        render :new
      end
    end
  end

  def destroy
  end

  private

    def set_rider
    @rider = Rider.find(params[:rider_id])
  end
end
