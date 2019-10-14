class StocksController < ApplicationController

    protect_from_forgery except: :search

    def search
        if params[:stock].present?
          @stock = Stock.new_from_lookup(params[:stock])
          if @stock
            respond_to do |format|
                format.js { render partial: 'users/result' }
              end
          else
            flash.now[:danger] = "You have entered an incorrect symbol"
            respond_to do |format|
                format.js { render partial: 'users/result' }
              end
          end
        else
            flash.now[:danger] = "You have entered an empty search string"
            respond_to do |format|
                format.js { render partial: 'users/result' }
              end
        end
    end
end