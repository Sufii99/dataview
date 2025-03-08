Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :contact_form, only: %i[new create]
  Rails.application.routes.draw do
    get "contact", to: "contact_form#new", as: :contact
  end

  # Rutas protegidas (solo accesibles si está autenticado)
  authenticated :user do
    get "subir_datos", to: "uploads#new", as: :subir_datos
    get "mis_archivos", to: "uploads#index", as: :mis_archivos
  end

  # Rutas accesibles sin iniciar sesión
  # resources :home, only: [ :index ]
  # get "ejemplos", to: "home#ejemplos" # Vista de Ejemplos
  # get "manual", to: "home#manual"   # Vista de Manual
  # get "contacto", to: "home#manual"   # Vista de Contacto
end
