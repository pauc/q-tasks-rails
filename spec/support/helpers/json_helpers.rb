module JSONHelpers
  def json(body)
    @json ||= JSON.parse(body, symbolize_names: true)
  end

  def json_response
    @json_response ||= json response.body
  end

  def json_data
    json_response[:data]
  end

  def json_attributes
    json_data[:attributes]
  end

  def json_relationships
    json_data[:relationships]
  end

  def json_errors
    json_response[:errors]
  end

  def json_included
    json_response[:included]
  end
end
