require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Slint'})
artist2 = Artist.new({'name' => 'Flying Lotus'})
artist3 = Artist.new({'name' => 'Battles'})
artist4 = Artist.new({'name' => 'Elton John'})
artist5 = Artist.new({'name' => 'Madvillain'})
artist6 = Artist.new({'name' => 'Explosions in the Sky'})
artist7 = Artist.new({'name' => 'Caribou'})
artist8 = Artist.new({'name' => 'Mogwai'})
artist9 = Artist.new({'name' => 'C. Duncan'})
artist10 = Artist.new({'name' => 'Sufjan Stevens'})
artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()
artist6.save()
artist7.save()
artist8.save()
artist9.save()
artist10.save()



album1 = Album.new({'title' => 'Spiderland', 'quantity' => 5, 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'Los Angeles', 'quantity' => 3, 'artist_id' => artist2.id})
album3 = Album.new({'title' => 'Until the Quiet Comes', 'quantity' => 4, 'artist_id' => artist2.id})
album4 = Album.new({'title' => 'Mirrored', 'quantity' => 1, 'artist_id' => artist3.id})
album5 = Album.new({'title' => 'Goodbye Yellow Brick Road ', 'quantity' => 8, 'artist_id' => artist4.id})
album6 = Album.new({'title' => 'madvillainy', 'quantity' => 2, 'artist_id' => artist5.id})
album7 = Album.new({'title' => 'The Earth Is Not a Cold Dead Place', 'quantity' => 7, 'artist_id' => artist6.id})
album8 = Album.new({'title' => 'Our Love', 'quantity' => 3, 'artist_id' => artist7.id})
album9 = Album.new({'title' => 'Come On Die Young', 'quantity' => 3, 'artist_id' => artist8.id})
album10 = Album.new({'title' => 'Architect', 'quantity' => 4, 'artist_id' => artist9.id})
album11 = Album.new({'title' => 'Carrie and Lowell', 'quantity' => 3, 'artist_id' => artist10.id})
album12 = Album.new({'title' => 'The Midnight Sun', 'quantity' => 3, 'artist_id' => artist9.id})
album13 = Album.new({'title' => 'Michigan', 'quantity' => 3, 'artist_id' => artist10.id})


album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()
album7.save()
album8.save()
album9.save()
album10.save()
album11.save()
album12.save()
album13.save()


# artist2.name = "C Duncan"
# artist2.update()

# album2.title = "1983"
# album2.update()

# p Artist.all()
# p Album.all()

# artist1.delete()

# p Artist.find(artist2.id)
# p Album.find(album1.id)

# artist_name()
# album_title()
# total()
