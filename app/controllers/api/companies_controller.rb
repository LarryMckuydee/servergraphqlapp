class Api::CompaniesController < ApiController
  def create
    queries = params[:query]
    result = ApplicationSchema.execute(queries)
    render json: result
  end

  def options
    render nothing: true, status: 200
  end
end
