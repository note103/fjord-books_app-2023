Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
    resources :books
    root "books#index"
  end
end
