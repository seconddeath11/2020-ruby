# frozen_string_literal: true

require 'dry-schema'

RoutSchema = Dry::Schema.Params do
  required(:stops).filled(:integer, gt?: 0)
  required(:length).filled(:integer, gt?: 0)
  required(:name).filled(:integer, gt?: 0)
  required(:buses).filled(:integer, gt?: 0)
end
