# frozen_string_literal: true

require 'dry-schema'
require_relative 'schema_types'

EditBusSchema = Dry::Schema.Params do
  required(:rout).filled(:integer, gt?: 0)
  required(:state).filled(SchemaTypes::StrippedString, included_in?: StateType.all)
end
