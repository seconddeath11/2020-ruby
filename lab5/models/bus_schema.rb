# frozen_string_literal: true

require 'dry-schema'
require_relative 'schema_types'

BusSchema = Dry::Schema.Params do
  required(:number).filled(:integer, gt?: 0)
  required(:consumption).filled(:integer, gt?: 0)
  required(:name).filled(SchemaTypes::StrippedString)
  required(:rout).filled(:integer, gt?: 0)
  required(:state).filled(SchemaTypes::StrippedString, included_in?: StateType.all)
end
