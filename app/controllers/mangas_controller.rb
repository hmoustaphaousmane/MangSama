require 'uri'

class MangasController < ApplicationController
    def index
<<<<<<< HEAD
        # Only authorize those who have read privilege on the class Mango to view
        authorize! :read, Manga

        @manga = Manga.all
=======
        @mangas = Manga.all
>>>>>>> dbbe1de04ac6355f27bfca9c1654c7b1700db266
        @results = []
    end

    def search
        query = params[:query]
        @results = search_manga(query)
    end

    def show
        @manga = Manga.find(params[:id])
        @characters = @manga.characters.limit(12)
    end
   
    private

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
end
