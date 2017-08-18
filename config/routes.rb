Rails.application.routes.draw do
  resources :replies
  resources :blogs do
    member do
	  get 'incriment' => 'blogs#incriment'
	  get 'replyshow' => 'replies#index'
	  get 'createrep' => 'replies#new'
	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
end
