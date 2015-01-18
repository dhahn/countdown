module Api
	module V1
		class EventsController < ApiController
		  before_action :set_event, only: [:update, :destroy, :show]

		  # GET /events
		  # GET /events.json
		  def index
		    @events = Event.all

		    render json: @events
		  end

		  def show
		  	render json: @event
		  end

		  # POST /events
		  # POST /events.json
		  def create
		    @Event = Event.new(event_params)

		    respond_to do |format|
		      if @event.save
		        format.json { render :index, status: :created, location: @event }
		      else
		        format.json { render json: @event.errors, status: :unprocessable_entity }
		      end
		    end
		  end

		  # PATCH/PUT /events/1
		  # PATCH/PUT /events/1.json
		  def update
		    respond_to do |format|
		      if @event.update(event_params)
		        format.json { render :index, status: :ok, location: @event }
		      else
		        format.json { render json: @event.errors, status: :unprocessable_entity }
		      end
		    end
		  end

		  # DELETE /events/1
		  # DELETE /events/1.json
		  def destroy
		    @event.destroy
		    respond_to do |format|
		      format.json { head :no_content }
		    end
		  end

		  private
		    # Use callbacks to share common setup or constraints between actions.
		    def set_event
		      @event = Event.find(params[:id])
		    end

		    # Never trust parameters from the scary internet, only allow the white list through.
		    def event_params
		      params.require(:event).permit(:moment, :slug, :name)
		    end
		end
	end
end