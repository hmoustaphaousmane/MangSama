require 'uri'

class MangasController < ApplicationController

    before_action :authenticate_user!, only: [:show]

    def index
        # Only authorize those who have read privilege on the class Mango to view
        authorize! :read, Manga

        @mangas = Manga.paginate(page: params[:page], per_page: 10)

        @last_page = (@mangas.total_entries.to_f / @mangas.per_page).ceil


        @results = []

        
    end

    def search
        query = params[:query]
        @results = search_manga(query)
    end

    def show
        @manga = Manga.find(params[:id])
        @characters = @manga.characters.limit(12)

        @comments = @manga.comments.includes(:user)
    end

    def top_mangas
        @top_mangas = fetch_top_mangas
    end

    def recommended
        @recommended_mangas = fetch_mangas_recommendations
    end
   
    private

    #Rechercher un manga
    def search_manga(query)
        encoded_query = URI.encode_www_form_component(query)
        url = "https://api.jikan.moe/v4/manga?q=#{encoded_query}"
        response = HTTParty.get(url)

        if response.code == 200
            manga_data = JSON.parse(response.body)
            return manga_data['data']
        else
            puts "Erreur lors de la requête à l'API Jikan"
            return nil
        end
    end

    # Logique pour récupérer les top mangas
    def fetch_top_mangas
        url = 'https://api.jikan.moe/v4/top/manga'

        response = HTTParty.get(url)
        data = JSON.parse(response.body)

        top_mangas = data['data']

        top_mangas
    end
    
    # Logique pour récupérer les mangas recommendés
    def fetch_mangas_recommendations
        url = 'https://api.jikan.moe/v4/recommendations/manga'

        response = HTTParty.get(url)
        data = JSON.parse(response.body)

        top_mangas = data['data']

        top_mangas
    end


end
