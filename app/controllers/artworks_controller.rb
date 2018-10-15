class ArtworksController < ApplicationController
  def index
    render json: Artwork.artworks_for_user_id(params[:user_id])
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save!
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update

    artwork = Artwork.find(params[:id])
    options_hash = artwork.attributes.merge(artwork_params)

    if artwork.update(options_hash)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 404
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    redirect_to artworks_url
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
