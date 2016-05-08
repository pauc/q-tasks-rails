module HasDefaultOperations
  extend ActiveSupport::Concern

  private

  def default_operation
    return @default_operation if @default_operation

    operation_klass =
      case self.action_name
      when 'index'
        :FetchCollection
      when 'show'
        :FetchRecord
      when 'create'
        :CreateRecord
      when 'update'
        :UpdateRecord
      when 'destroy'
        :DestroyRecord
      else
        raise "Can not create operation for action `#{self.action_name}`"
      end

    @default_operation = operations_namespace.const_get(operation_klass)
      .new(context: self, params: params)
  end

  def operations_namespace
    self.class
  end

  def response_options_for(action_name)
    send("response_options_for_#{action_name}")
  end

  def response_options_for_index
    { include: included_relations }
  end

  def response_options_for_show
    { include: included_relations }
  end

  def response_options_for_create
    {}
  end

  def response_options_for_update
    {}
  end

  def response_options_for_destroy
    {}
  end

  module ClassMethods
    def default_operations_for(*actions)
      actions.each do |action|
        define_method action do
          respond_with default_operation.result, **response_options_for(action)
        end
      end
    end
  end
end
