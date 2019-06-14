Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount StripeEvent::Engine, at: '/webhooks/stripe'

  devise_for :users, controllers: {registrations: 'users/registrations', confirmations: 'confirmations'}, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}  

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    resources :expert_profiles
    resources :lessons
    resource :membership
    resources :matches
    resources :charges
    resources :languages
    resources :users, only: [:show, :index]

    get 'home', to: 'pages#home'
    get 'promo', to: 'pages#home_promo'
    get 'business', to: 'pages#home_business'
    get 'ingles', to: 'pages#home_ingles'
    get 'frances', to: 'pages#home_frances'
    get 'italiano', to: 'pages#home_italiano'
    get 'español', to: 'pages#home_español'
    get 'portugues', to: 'pages#home_portugues'
    get 'aleman', to: 'pages#home_aleman'
    get 'ruso', to: 'pages#home_ruso'
    get 'chino', to: 'pages#home_chino'
    get 'english', to: redirect("https://www.5roots.co/en/ingles")
    get 'french', to: redirect("https://www.5roots.co/en/frances")
    get 'italian', to: redirect("https://www.5roots.co/en/italiano")
    get 'spanish', to: redirect("https://www.5roots.co/en/español")
    get 'portuguese', to: redirect("https://www.5roots.co/en/portugues")
    get 'german', to: redirect("https://www.5roots.co/en/aleman")
    get 'russian', to: redirect("https://www.5roots.co/en/ruso")
    get 'chinese', to: redirect("https://www.5roots.co/en/chino")
    get 'memberships', to: 'pages#subscriptions'
    get 'faq', to: 'pages#faq'
    get '/form', to: redirect("https://www.5roots.co/register?locale=es&plan=8")
    get '/aplica', to: redirect("https://www.5roots.co/register?locale=es&plan=1")
    get '/apply', to: redirect("https://www.5roots.co/register?locale=en&plan=1")



  	unauthenticated do
  	   root :to => 'pages#home'
  	end

  	authenticated :user, ->(u) { u.has_role?(:teacher) } do
  	  root to: "lessons#index", as: :teacher_root
  	end

  	authenticated :user, ->(u) { u.has_role?(:user) } do
  	  root to: "lessons#index" , as: :students_root
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
