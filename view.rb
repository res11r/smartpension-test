require 'pry-byebug'
# the class View contains webpage views as objects, each view having two instance variables 'path' and 'ip_address'
# and contains a class variable 'views_array' to store the webpage views
class View
  @@views_array = []
  attr_reader :path, :ip_address

  def initialize(path, ip_address)
    @path = path
    @ip_address = ip_address
  end

  # The following method takes one argument, the file_path string, loads the file and stores the views contained in the
  # class variable 'views_array'
  def self.load(file_path)
    File.open(file_path).each do |line|
      @@views_array << View.new(line.split(' ')[0], line.split(' ')[1]) unless line.gsub("\n", '').length.zero?
    end
  end

  # The following method takes one argument (a views array, with the class variable 'views_array' as default), returns
  # an array sorted in descending order by the number of ip addresses in each array element
  def self.total_views(views_array = @@views_array)
    hash = {}
    views_array.each { |view| hash.key?(view.path) ? hash[view.path] << view.ip_address : hash[view.path] = [view.ip_address] }
    hash.sort_by { |_k, v| -v.count }
  end

  # The following method takes one argument (a views array, with the class variable 'views_array' as default), returns
  # an array sorted in descending order by the number of unique ip addresses in each array element
  def self.unique_views(views_array = @@views_array)
    hash = {}
    total_views(views_array).each { |view| hash[view[0]] = view[1].uniq }
    hash.sort_by { |_k, v| -v.count }
  end

  def self.display_visits(array)
    array.each { |page| puts "#{page[0]} #{page[1].count} visits" }
  end 
end
