require 'pry-byebug'
require_relative 'view'

View.load(ARGV[0])
puts 'total visits:'
if View.total_views.length.zero? 
  puts "None"
else 
  View.display_visits(View.total_views)
end
puts 'unique visits:'
if View.total_views.length.zero?
  puts "None"
else
  View.display_visits(View.unique_views)
end 