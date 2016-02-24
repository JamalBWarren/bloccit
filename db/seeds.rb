require "random_data"

50.times do
    
    Post.create!(
        
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
end
    posts = Post.all
    
    
100.times do
        Comment.create!(
            
            post: posts.sample,
            body: RandomData.random_paragraph)
end

uniqpost = Post.find_or_create_by(title: "This is a unique title", body:"this is a unique body")
Comment.find_or_create_by(body: "unique comment body", post: uniqpost)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
