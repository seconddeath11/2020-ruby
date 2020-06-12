# frozen_string_literal: true

require 'dry-schema'

RoutDeleteSchema = Dry::Schema.Params do
  required(:rout).filled(:integer)
end
