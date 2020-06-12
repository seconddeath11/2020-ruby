# frozen_string_literal: true

require 'dry-schema'
require_relative 'schema_types'

FilterBusesSchema = Dry::Schema.Params do
  optional(:state).filled(SchemaTypes::StrippedString, included_in?: StateType.all)
end
