class ErrorsSerializer

  attr_reader :resource

  def initialize(resource)
    @resource = resource

    extend_with_strategy
  end

  def format_errors
    preprocess_errors(resource.errors)

    association_names =
      resource.class.reflect_on_all_associations.map(&:name)

    errors_array = []

    resource.errors.messages.each do |key, messages|
      messages.each do |message|
        pointer = if association_names.include? key
                    "/data/relationships/#{key}"
                  else
                    "/data/attributes/#{key}"
                  end

        errors_array << {
          detail: message,
          source: {
            pointer: pointer
          }
        }
      end
    end

    postprocess_errors(errors_array)

    errors_array
  end

  private

  def preprocess_errors(errors_object)
    # NOOP
  end

  def postprocess_errors(errors_array)
    # NOOP
  end

  # Looks for a module in `app/serializers/api_v1_errors_serializer/`
  # folder end extends `self` with this module to override
  # `#preprocess_errors(...)` and `#postprocess_errors(...)`.
  # If the module does not exist do nothing.
  def extend_with_strategy
    resource_class_name = resource.class.name
    errors_translator_module_name =
      "#{self.class.name}::#{resource_class_name}ErrorsTranslator"

    begin
      self.extend errors_translator_module_name.constantize
    rescue NameError
    end
  end
end
