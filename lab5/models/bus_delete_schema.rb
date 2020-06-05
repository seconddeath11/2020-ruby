# frozen_string_literal: true

require 'dry-schema'

BusDeleteSchema = Dry::Schema.Params do
  required(:confirmation).filled(true)
end
