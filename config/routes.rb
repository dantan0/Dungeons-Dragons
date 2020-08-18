Rails.application.routes.draw do
  get 'static_pages/home'
  get 'books/index'
  get 'books/create'
  get 'books/new'
  get 'books/edit'
  get 'books/show'
  get 'books/update'
  get 'books/destroy'
  get 'spells/index'
  get 'spells/create'
  get 'spells/new'
  get 'spells/edit'
  get 'spells/show'
  get 'spells/update'
  get 'spells/destroy'
  get "delete_spell_from_book", to: "books#delete_spell_from_book"
  get "add_spell_to_book", to: "books#add_spell_to_book"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :spells, :books, :spellbooks
    root to: 'static_pages#home'
end
