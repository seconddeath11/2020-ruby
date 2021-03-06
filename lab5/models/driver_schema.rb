# frozen_string_literal: true

require 'dry-schema'
require_relative 'schema_types'

DriverSchema = Dry::Schema.Params do
  optional(:driver).filled(SchemaTypes::StrippedString)
end
