require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')


artist1 = Artist.new({'name' => 'Prince'})
artist1.save()

album1 = Album.new({
  'title' => 'Purple Rain',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })
album1.save()


binding.pry

nil
