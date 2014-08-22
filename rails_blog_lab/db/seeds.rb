# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


post = Post.find_by_id(16)
comment = Comment.create(author: "Dippy", title: "Really great", body: "Do you want more traffic to your blog")
post.comments << comment

comment = Comment.create(author: "Adrianna", title: "This is ok", body: "Do you want more traffic to your blog")
post.comments << comment