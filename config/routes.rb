Rails.application.routes.draw do
  root 'welcome#index'

  use_doorkeeper do
    skip_controllers :applications, :authorized_applications, :authorizations, :token_info
  end

  resources :teams

  scope path: "/:team_id" do
    with_options except: [:new, :edit] do
      resources :projects
    end
  end

  get "*path", to: "welcome#index"
end
