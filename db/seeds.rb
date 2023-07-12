# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'httparty'


Character.destroy_all
Categorization.destroy_all
Manga.destroy_all
Statistic.destroy_all
Category.destroy_all






# Méthode pour récupérer les données d'un manga spécifique depuis l'API Jikan
def fetch_manga_data(mal_id)
  url = "https://api.jikan.moe/v4/manga/#{mal_id}"
  response = HTTParty.get(url)

  if response.code == 200
    manga_data = JSON.parse(response.body)
    # Traitez les données du manga comme nécessaire
    return manga_data
  else
    puts "Erreur lors de la requête à l'API Jikan"
    return nil
  end
end

# Méthode pour récupérer les personnages d'un manga spécifique depuis l'API Jikan
def fetch_manga_characters(mal_id)
  url = "https://api.jikan.moe/v4/manga/#{mal_id}/characters"
  response = HTTParty.get(url)

  if response.code == 200
    manga_character = JSON.parse(response.body)
    # Traitez les données du manga comme nécessaire
    return manga_character
  else
    puts "Erreur lors de la requête à l'API Jikan"
    return nil
  end
end


# Méthode pour récupérer les stats d'un manga spécifique depuis l'API Jikan
def fetch_manga_statistics(mal_id)
  url = "https://api.jikan.moe/v4/manga/#{mal_id}/statistics"
  response = HTTParty.get(url)

  if response.code == 200
    manga_stats = JSON.parse(response.body)
    # Traitez les données du manga comme nécessaire
    return manga_stats
  else
    puts "Erreur lors de la requête à l'API Jikan"
    return nil
  end
end



# Méthode pour effectuer le seed des données de manga
def seed_manga(mal_id)
  manga_data_fetched = fetch_manga_data(mal_id)
  manga_character_fetched = fetch_manga_characters(mal_id)
  manga_stats_fetched = fetch_manga_statistics(mal_id)

  if manga_stats_fetched
    manga_stats = manga_stats_fetched['data']
    score = manga_stats['scores'][0]
    vote = manga_stats['scores'][1]
    percentage = manga_stats['scores'][2]
    statistic = Statistic.create!(
      reading: manga_stats['reading'],
      on_hold: manga_stats['on_hold'],
      completed: manga_stats['completed'],
      dropped: manga_stats['dropped'],
      plan_to_read: manga_stats['plan_to_read'],
      total: manga_stats['total'],
      score: score['score'],
      votes: vote['votes'],
      percentage: percentage['percentage']
    )

    if manga_data_fetched
      manga_data = manga_data_fetched['data']
      # Seed du manga
      authors = manga_data['authors']
      manga = Manga.create!(
        statistic: statistic,
        url: manga_data['url'],
        title: manga_data['title'],
        volumes: manga_data['volumes'],
        chapters: manga_data['chapters'],
        author_name: authors.map { |author| author['name'] }.join(', '),
        synopsis: manga_data['synopsis'],
        cover_image: manga_data['images']['jpg']['large_image_url']
        # Autres attributs du manga
      )
  
      # Seed des catégories du manga
      manga_data['genres'].each do |genre_data|
        category = Category.find_or_create_by(
          name: genre_data['name']
          # Autres attributs de la catégorie
        )
  
  
        # Création de l'instance de Categorization
        Categorization.create!(
          manga: manga,
          category: category
        )
      end
      if manga_character_fetched
        manga_characters = manga_character_fetched['data']
        manga_characters.each do |character_data|
          character = character_data['character']
          Character.create!(
            manga_id: manga.id,
            name: character['name'],
            image_url: character['images']['webp']['image_url'],
            role: character_data['role']
          )
        end
      end
    end



    puts "Manga seedé avec succès !"
  else
    puts "Échec du seed du manga."
  end

end



# Appeler la méthode pour effectuer le seed d'un manga spécifique
10.times do |i|
  i += 1
  seed_manga(i) # Remplacez 21 par l'ID du manga que vous souhaitez seed
end

# Vous pouvez appeler la méthode seed_manga avec différents ID de manga pour seed plusieurs mangas

# Exemple : seed_manga(1)
# Exemple : seed_manga(10)
# Exemple : seed_manga(100)


#category = Category.find_or_create_by(name: 'Nouvelle catégorie')
#category.mangas.create(title: 'Nouveau manga', synopsis: 'Synopsis du nouveau manga')
