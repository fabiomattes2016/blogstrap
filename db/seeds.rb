Article.delete_all

user = User.first

p "Iniciando ..."

Category.all.each do |category|
    30.times do
        Article.create!(
            title: LoremIpsum.lorem_ipsum(words: 5),
            body: LoremIpsum.random(paragraphs: 3),
            category_id: category.id,
            user_id: user.id,
            created_at: rand(365).days.ago
        )
    end
end

p "Terminou!!!"
