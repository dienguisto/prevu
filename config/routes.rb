Rails.application.routes.draw do
  get '/reporting' => 'reporting#index', as: :reporting
  get '/reporting/by_sexe' => 'reporting#stat_by_sex', as: :reporting_sex
  get '/reporting/by_status_mat' => 'reporting#stat_by_situation_matrimoniale',
    as: :reporting_status_mat

  scope '/parametres' do
    get '/categories' => 'parametres#categories'
    post '/groupes/add' => 'parametres#add_groupe'
    post '/tags/add' => 'parametres#add_tag'
    post '/medicaments/add' => 'parametres#add_medicament'
    post '/type_acte_medical/add' => 'parametres#add_type_acte_medical'
    post '/categorie_acte_medical/add' => 'parametres#add_categorie_acte_medical'
    delete '/:id' => 'parametres#destroy', :as => 'destroy'
  end

  resources :consultations do
    get '/facture' => 'consultations#facture'
  end
  resources :ordonnances do
    get '/facture' => 'ordonnances#facture'
  end

  resources :users, path: '/custom/users'
  resources :sessions
  resources :parametres
  resources :structure_aperitrices
  resources :micro_assurances
  resources :mutuelles
  resources :pharmacies
  resources :formation_sanitaires
  resources :adherents
  resources :groupes
  resources :formules do
    get 'ajouter_structure_sanitaire/:id_structure' => 'formules#ajouter_structure_sanitaire', as: :ajouter_structure_sanitaire
    get 'activer_structure_sanitaire/:id_structure' => 'formules#activer_structure_sanitaire', as: :activer_structure_sanitaire
    get 'desactiver_structure_sanitaire/:id_structure' => 'formules#desactiver_structure_sanitaire', as: :desactiver_structure_sanitaire
  end
  resources :medicaments do
    get 'activer'
    get 'desactiver'
  end
  resources :versements, only: [:index] do
    get 'new_versement', on: :collection
    post 'redirect_versement', on: :collection
  end
  resources :adherents do
    resources :versements, except: [:destroy, :update, :edit]
    resources :souscriptions do
      get 'activer'
      get 'desactiver'
    end
    resources :consultations do
      post 'confirm', on: :collection
    end
    resources :ordonnances do
      post 'confirm', on: :collection
    end
    get 'affiliers' => 'adherents#affiliers', :as => 'affiliers'
    get 'add_affiliation' => 'adherents#new_parrainage', :as => 'new_parrainage'
    get 'edit_affiliation' => 'adherents#edit_parrainage', :as => 'edit_parrainage'
    get 'carte_assurance' => 'adherents#carte_assurances', as: :carte_assurance_adherent
  end


  get 'dashboard/minor'
  get '/log_out' => 'sessions#destroy', :as => 'log_out'
  get '/log_in' => 'sessions#new', :as => 'log_in'
  get '/sign_up' => 'adherents#new', :as => 'sign_up'

  devise_for :users,
             controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
    match '/users/sign_out', to: 'users/sessions#destroy', via: :get
  end

  scope '/adherents' do
    get '/:id/activate' => 'adherents#activate', as: :activer_adherent

    post '/carte_assurance' => 'adherents#carte_assurances', as: :carte_assurances_adherent
    get '/:id/desactivate' => 'adherents#desactivate', as: :desactiver_adherent
  end

  scope '/structure_assurance' do
    get '/:id/activer' => 'structure_assurances#activer', as: :activer_structure_assurance
    get '/:id/desactiver' => 'structure_assurances#desactiver', as: :desactiver_structure_assurance
  end

  scope '/structure_sanitaire' do
    get '/:id/activer' => 'structure_sanitaires#activer', as: :activer_structure_sanitaire
    get '/:id/desactiver' => 'structure_sanitaires#desactiver', as: :desactiver_structure_sanitaire
  end

  scope '/contacts' do
    get '/new/:owner_type/:owner_id' => 'contacts#new', as: :new_contact
    post '/create/:owner_type/:owner_id' => 'contacts#create', as: :create_contact
  end

  root 'dashboard#index'
  scope '/wservices' do
    post '/groupes' => 'ws#get_groupes'
    post '/adherent' => 'ws#adherent_infos'
  end
end
