Rails.application.routes.draw do
  root 'welcome#index'

  use_doorkeeper do
    skip_controllers :applications, :authorized_applications, :authorizations, :token_info
  end

  resources :teams

  scope path: "/:team_id" do
    with_options except: [:new, :edit] do
      resources :goals
      resources :projects
      resources :tasks
      resources :users, only: [:index, :show]
    end
  end

  get "*path", to: "welcome#index"
end
