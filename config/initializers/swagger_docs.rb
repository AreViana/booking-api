# frozen_string_literal: true

# Require swagger files
files = Dir.glob(Rails.root.join('docs', 'swagger', '*.rb'))
files.each { |file| require file }
