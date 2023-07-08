# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'httparty'



Categorization.destroy_all
Manga.destroy_all
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


# Méthode pour effectuer le seed des données de manga
def seed_manga(mal_id)
  manga_data_fetched = fetch_manga_data(mal_id)

  if manga_data_fetched
    manga_data = manga_data_fetched['data']
    # Seed du manga
    authors = manga_data['authors']
    manga = Manga.create(
      url: manga_data['url'],
      title: manga_data['title'],
      author_name: authors.map { |author| author['name'] },
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
      Categorization.create(
        manga: manga,
        category: category
      )
    end

    puts "Manga seedé avec succès !"
  else
    puts "Échec du seed du manga."
  end
end



# Appeler la méthode pour effectuer le seed d'un manga spécifique
seed_manga(21) # Remplacez 21 par l'ID du manga que vous souhaitez seed

# Vous pouvez appeler la méthode seed_manga avec différents ID de manga pour seed plusieurs mangas

# Exemple : seed_manga(1)
# Exemple : seed_manga(10)
# Exemple : seed_manga(100)


#category = Category.find_or_create_by(name: 'Nouvelle catégorie')
#category.mangas.create(title: 'Nouveau manga', synopsis: 'Synopsis du nouveau manga')
