# frozen_string_literal: true

json.extract! technique, :id, :name, :title, :description, :created_at, :updated_at
json.url technique_url(technique, format: :json)
