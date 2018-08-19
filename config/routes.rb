Rails.application.routes.draw do
resources :posts
get 'top' => 'root#top'

root to: 'root#top'

end
