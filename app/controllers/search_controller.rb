class SearchController < ApplicationController
  before_action :lastfm, except: [ :home ]

  def home

  end

  def search_artist
    @artist_name = params[:search_artist]
    redirect_to list_artists_path(@artist_name)
  end

  def list_artists
    resp = lastfm.artist.search(artist: params[:artist_name], limit: 10)
    if resp['status'] == 'ok'
      $more_artists = resp['results']['totalResults'].to_i - 10
      @artist_matched = resp['results']['artistmatches']['artist']
      $page_count = 1
      $previous_artists = 0
    else

    end
  end

  def get_next_page
    $more_artists = params[:remaining].to_i
    if $more_artists > 0
      $page_count += 1
      $more_artists -= 10
      $previous_artists += 10
      fetch_artists
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def get_previous_page
    $previous_artists = params[:previous].to_i
    if $more_artists > 0
      $page_count -= 1
      $more_artists += 10
      $previous_artists -= 10
    end
    fetch_artists
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show_artist
    artist_name = params[:artist_name]
    artist = lastfm.artist
    @resp = artist.get_info(artist: artist_name)
    tracks = artist.get_top_tracks(artist: artist_name, limit: 10)
    albums = artist.get_top_albums(artist: artist_name, limit: 10)
    @resp.merge!({"tracks" => tracks, "albums" => albums})
  end

  def get_similar

  end

  protected

  def lastfm
    lastfm = Lastfm.new(ENV['LAST_FM_API'], ENV['LAST_FM_SECRET'])
  end

  def fetch_artists
    resp = lastfm.artist.search(artist: params[:artist_name], limit: 10, page: $page_count)
    if resp['status'] == 'ok'
      @artist_matched = resp['results']['artistmatches']['artist']
    end
  end
end
