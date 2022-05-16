require 'pry-byebug'
require_relative 'view'
View.load(ARGV[0])
puts 'total visits:'
View.total_views.each { |page| puts "#{page[0]} #{page[1].count} visits" }
puts 'unique visits:'
View.unique_views.each { |page| puts "#{page[0]} #{page[1].count} visits" }