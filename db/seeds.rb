# frozen_string_literal: true

# Seed depending on environment

['all', Rails.env].each do |seed|
  seed_file = "#{Rails.root}/db/seeds/#{seed}.rb"
  if File.exist?(seed_file)
    puts "Loading seed data for #{seed}..."
    require seed_file
  end
end
