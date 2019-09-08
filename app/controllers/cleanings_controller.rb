class CleaningsController < ApplicationController
    respond_to :html, :json
    def create
        @cleaning = Cleaning.new(cleaning_params)
        if @cleaning.save
            respond_to do |format|
                format.html { render :created }
                format.json { render(json: @cleaning) }
            end
        else
            render(json: {errors: @thing.errors}, status: 500)
        end        
    end

    private

    def cleaning_params
        params.require(:cleanings).permit(:date_cleaned, :diverted, :user_id, :thing_id)
    end

end