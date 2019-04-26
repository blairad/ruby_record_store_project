require_relative('../models/album')
require_relative('../models/artist')

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

# artist2.name = "C Duncan"
# artist2.update()

# p Artist.all()
