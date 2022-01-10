class SearchController < ApplicationController
  def search
    @results = Elasticsearch::Model.search(params[:text], [Service, Work]).records.to_a
  end
end