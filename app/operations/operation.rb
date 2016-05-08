class Operation
  delegate :current_team, :current_user, :authorize!, to: :context

  def initialize(params:, context:, options: {})
    @params  = params
    @context = context
    @options = options
  end

  def result
    perform unless @result

    fail "You must set @result in the #perform method in #{self.class}" unless @result

    @result
  end

  def errors
    result.errors
  end

  def ok?
    errors.blank?
  end

  private

  attr_reader :params, :context, :options

  def result=(op_result)
    @result = op_result
  end

  def perform
    raise NotImplementedError,
      "You must define the method #perform in #{self.class}"
  end
end
