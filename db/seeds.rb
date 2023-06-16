# Distribua cada post para mais de uma categoria e, além disso, para um post, componha 2 feedbacks e 2 comentários

Category.create(id: 1, name: "Games", description:"Tudo relacionado a jogos de videogame")
Category.create(id: 2, name: "Animes e Mangás", description:"Discussões sobre anime e mangá")
Category.create(id: 3, name: "Programação", description:"Aprendizado sobre Programação e relacionados")

Post.create(id: 1, title:"Item dupl in TotK is no more", content:"They removed item dupl, why???")
Post.create(id: 2, title:"How to Sekiro", content:"Learn to parry")
Post.create(id: 3, title:"For loop Python Tutorial", content:":D")

PostCategory.create(post_id: 1, category_id: 1)
PostCategory.create(post_id: 1, category_id: 3)

PostCategory.create(post_id: 2, category_id: 1)
PostCategory.create(post_id: 2, category_id: 2)

PostCategory.create(post_id: 3, category_id: 3)
PostCategory.create(post_id: 3, category_id: 1)

Feedback.create(like:true, user_id:123, post_id:1)
Commentary.create(content:"Nintendo doesnt know whats fun booo", user_id:123, post_id:1)
Feedback.create(like:false, user_id:321, post_id:1)
Commentary.create(content:"Item dupe defeats the purpose of the game >:(", user_id:321, post_id:1)

Feedback.create(like:true, user_id:456, post_id:2)
Commentary.create(content:"parry very op", user_id:456, post_id:2)
Feedback.create(like:false, user_id:654, post_id:2)
Commentary.create(content:"Maybe you should make a helpful guide", user_id:654, post_id:2)

Feedback.create(like:true, user_id:789, post_id:3)
Commentary.create(content:"Thanks, very helpful", user_id:789, post_id:3)
Feedback.create(like:false, user_id:987, post_id:3)
Commentary.create(content:"didnt work for me :(", user_id:987, post_id:3)
