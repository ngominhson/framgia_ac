Rails.application.routes.draw do
  match "excels", to: "excels#index", via: :get
  match "excels/import", to: "excels#import", via: :post

  root to:"excels#index", via: :get
end
