module Filtering
  private

  def filters
    return @filters if @filters

    allowed_filters = params[:filter] &&
      params[:filter].permit(*available_filters)

    @filters = allowed_filters.presence || {}
  end

  def apply_filters
    filters.each do |filter, value|
      send "filter_by_#{filter}", value
    end
  end

  def available_filters
    raise NotImplementedError,
      "You must define #available_filters in #{self.class}"
  end

  def filter_by_id(value)
    return unless value.to_s.present?

    ids = value.split(',')

    return if ids.empty?

    self.result = result.where(id: ids)
  end
end
