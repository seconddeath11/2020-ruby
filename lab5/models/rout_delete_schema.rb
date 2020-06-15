# frozen_string_literal: true

require 'dry-schema'

RoutDeleteSchema = Dry::Schema.Params do
  optional(:rout).filled
end
