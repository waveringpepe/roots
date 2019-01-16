Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations' },  path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :blogs

	unauthenticated do
	   root :to => 'pages#home'
	end

	authenticated :user, ->(u) { u.has_role?(:teacher) } do
	  root to: "pages#teachers_home", as: :teacher_root
	end

	authenticated :user, ->(u) { u.has_role?(:user) } do
	  root to: "pages#students_home", as: :students_root
	end

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'faq', to: 'pages#faq'


  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
