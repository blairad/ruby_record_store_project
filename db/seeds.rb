require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Slint'})
artist2 = Artist.new({'name' => 'Flying Lotus'})
# artist3 = Artist.new({'name' => 'Slint'})
# artist4 = Artist.new({'name' => 'Slint'})
# artist5 = Artist.new({'name' => 'Slint'})
# artist6 = Artist.new({'name' => 'Slint'})
# artist7 = Artist.new({'name' => 'Slint'})
# artist8 = Artist.new({'name' => 'Slint'})
# artist9 = Artist.new({'name' => 'Slint'})
# artist10 = Artist.new({'name' => 'Slint'})
artist1.save()
artist2.save()



album1 = Album.new({'title' => 'Spiderland', 'stock' => 5, 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'Los Angeles', 'stock' => 3, 'artist_id' => artist2.id})


album1.save()
album2.save()

# artist2.name = "C Duncan"
# artist2.update()

# album2.title = "1983"
# album2.update()

# p Artist.all()
# p Album.all()

# artist1.delete()

# artist2.id()
artist2.find(50)
