Rails.application.routes.draw do
  # provide an index of sitemaps for crawlers
  get 'sitemap' => 'sitemaps#index', as: :sitemaps
  get 'sitemaps/:id' => 'sitemaps#show', as: :sitemap
end
