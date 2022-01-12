class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response

    private

    def record_not_found_response
        render json: { errors: 'Record Not Found' }, status: :not_found
    end
end
