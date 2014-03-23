User.delete_all

user = User.new
user.email = 'user@user.com'
user.first_name = 'Fred'
user.password = user.password_confirmation = 'password'
user.gender = 'M'
user.favourite_animal = 'Aardvark'
user.picture = 'http://static.comicvine.com/uploads/scale_super/6/61037/1641620-best_avatar_ever.png'
user.member_since = Time.now
user.save