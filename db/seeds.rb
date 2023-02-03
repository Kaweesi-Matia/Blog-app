# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users=User.create([{Name:"Kaweesi",photo:"",Bio:"He wants to get a remote job.:fake",PostsCounter:45},
{Name:"Nuhuel Molina",photo:"Am new here",Bio:"He wants to get a remote job.:fake",PostsCounter:45},
{Name:"Rodrigo De Paul",photo:"Am new here",Bio:"Iam a villian",PostsCounter:24},
{Name:"Wilber",photo:"Am new here",Bio:"Power is the most important resource",PostsCounter:23},
{Name:"Senteza",photo:"Am new here",Bio:"He wants food",PostsCounter:4}])
