Pb::Application.routes.draw do

  match "login" => "user#login"
  match "logout" => "user#logout" 
  match "oauth2callback" => "user#create"

  match "/search" =>"search#search"

  match "/property/:action" => "property"
  match "/property" => "property#index"
  match "/series/:action"=>"series"
  match "/series" => "series#index"
  match "/role/:action"=>"role"
  match "/product/:action"=>"product"
  match "/products/:action"=>"product"
  match "/products" => "product#index"
  match "/changelogs/:action"=>"changelogs"
  match "/changelogs"=>"changelogs#index"
  match "/series_bisac/delete"=>"series#delete_bisac"
  match "/series_genre/delete"=>"series#delete_genre"
  match "/series_territory/delete"=>"series#delete_territory"
  match "/product_territory/delete"=>"product#delete_territory"
  match "/product_territory/editfield"=>"product#edit_territory"
  match "/reports/:action"=>"reports"
  match "/reports/"=>"reports#index"
  match "/contacts/:action"=>"contact"
  match "/contacts/"=>"contact#index"
  match "/quick/:action"=>"quick"
  match "/quick/"=>"quick#index"

  root :to => "home#index"
end
