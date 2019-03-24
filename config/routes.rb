Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get 'angular-items', to: 'portfolios#show'

  resources :portfolios, except: [:show]
  resources 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  # same as above
  # get 'portfolio/:id', to: "portfolios#show", as: "portfolio_show"
  # method "path", to: "controller#method", as: "rails_alias"

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # method path, to: controller#method

  resources :blogs do
    member do
      get :toggle_status
    end
  end
 
  root to: 'pages#home'

  ##### This will catch all routes that start with posts but do not match any route
  ##### this will go to the posts controller and posts missing.html.erb view
  # get 'posts/*missing', to: 'posts#missing'

  #### how to put admin prefix before a route
  #### Dashboard controller will need to be in controllers/admin/dashboard_controller.rb
  #### heading will be        class Admin::DashboardController < ApplicationController
  #### also views will need to be nested in admin directory
  #### views/admin/dashboard/index.html.erb
  # namespace :admin do
  #   get 'dashboard/main'
  #   get 'dashboard/user'
  #   get 'dashboard/blog'
  # end
end
 