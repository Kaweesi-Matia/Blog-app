# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users=User.create([{Name:"Kaweesi", photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',Bio:"He wants to get a remote job.:fake",PostsCounter:45},
{Name:"Nuhuel Molina", photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',Bio:"He wants to get a remote job.:fake",PostsCounter:45},
{Name:"Rodrigo De Paul", photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',Bio:"Iam a villian",PostsCounter:24},
{Name:"Paul", photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',Bio:"Power is the most important resource",PostsCounter:23},
{Name:"Senteza",photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',Bio:"He wants food",PostsCounter:4}])

@second=User.create(Name:"Fred", photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',Bio:"He wants to get a remote job.:fake",PostsCounter:45)

@first_post = Post.create(Title: 'Hellowin', Text: 'This is my first post', user_id: 1,comments_counter:3,likes_counter:2)
@second_post = Post.create(Title: 'Musically', Text: 'Micheal Jackson is the best ever', user_id: 1,comments_counter:3,likes_counter:2)
