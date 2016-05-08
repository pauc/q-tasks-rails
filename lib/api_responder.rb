class ApiResponder < ActionController::Responder
  include Responders::HttpCacheResponder

  protected

  def json_resource_errors
    errors_array = ErrorsSerializer.new(resource).format_errors

    { :errors => errors_array }
  end

  def api_behavior
    raise ActionController::MissingRenderer.new(format) unless has_renderer?

    if get? || put? || patch?
      display resource, content_type: "application/vnd.api+json"
    elsif post?
      begin
        display resource, :status => :created, :location => nil,
          content_type: "application/vnd.api+json"
      rescue NoMethodError
        display resource, :status => :created,
          content_type: "application/vnd.api+json"
      end
    else
      head :no_content
    end
  end
end
