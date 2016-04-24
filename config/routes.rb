Rails.application.routes.draw do
  root 'welcome#index'

  use_doorkeeper do
    skip_controllers :applications, :authorized_applications, :authorizations, :token_info
  end

  resources :teams
end
