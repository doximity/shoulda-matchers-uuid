# frozen_string_literal: true

require "active_support/concern"
require "shoulda/matchers"

module ShouldaMatchersMysqlUuidFix
  extend ActiveSupport::Concern

  included do
    def next_scalar_value_for(scope, previous_value)
      if uuid?(scope)
        SecureRandom.uuid
      elsif defined_as_enum?(scope)
        available_values = available_enum_values_for(scope, previous_value)
        available_values.keys.last
      elsif polymorphic_type_attribute?(scope, previous_value)
        Uniqueness::TestModels.create(previous_value).to_s
      elsif previous_value.respond_to?(:next)
        previous_value.next
      elsif previous_value.respond_to?(:to_datetime)
        previous_value.to_datetime.next
      elsif boolean_value?(previous_value)
        !previous_value
      else
        previous_value.to_s.next
      end
    end

    def uuid?(scope)
      [
        column_for(scope),
        attribute_type_for(scope)
      ].compact.map(&:type).include? :uuid
    end

    def attribute_type_for(scope)
      return unless model.respond_to?(:attribute_types)

      model.attribute_types[scope.to_s]
    end
  end
end

Shoulda::Matchers::ActiveRecord::ValidateUniquenessOfMatcher.public_send(:include, ShouldaMatchersMysqlUuidFix)
