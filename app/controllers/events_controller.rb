class EventsController < ApplicationController
	before_action :authenticate_user!
	before_filter :verify_is_manager, :only => [:create, :new]

	def index
	  @events = Event.paginate(:page => params[:page])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		binding.pry
		if @event.save
      flash[:info] = "Event created!"
      redirect_to event_path(@event)
    else
      render :action => "new"
    end
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
	end

	def update
	end

	def delete
	end	

	private

	def verify_is_manager
	  (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.is_manager?)
	end
		
	def event_params
		binding.pry
		params.require(:event).permit(:name, :event_start_date, :event_finish_date, :avatar)
	end	
end
