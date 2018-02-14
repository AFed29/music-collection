require_relative('models/artist.rb')
require('pry-byebug')

artist1 = Artist.new({'name' => 'Prince'})
artist1.save()



binding.pry

nil
