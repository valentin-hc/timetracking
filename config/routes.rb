Rails.application.routes.draw do
  get "/" => "sites#home"
  get "/contact" => "sites#contact"
  get "/projects" => "projects#index"
  post "/projects" => "projects#create"
  get "/projects/new" => "projects#new" #order matters !
  get "/projects/:project_id/entries" =>"entries#index"
  get "/projects/:id" => "projects#show"
end
