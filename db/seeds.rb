
@post = Post.create(title: 'Hello Rails',
                       content: 'Please publish me',
                         published: false)
@admin = User.create(email: "as3nine@gmail.com", password: "d0screw1", password_confirmation: "d0screw1", role: "admin")
