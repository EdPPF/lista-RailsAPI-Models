Rails.application.routes.draw do
  # <método HTTPS> '<método rails (CRUD)>'
  namespace 'api' do
    namespace 'v1' do # create, index, show, update e delete;
      scope 'post' do
        post 'create', to:'post#create'
        get 'index', to:'post#index'
        get 'show/:id', to:'post#show'
        patch 'update/:id', to:'post#update'
        delete 'delete/:id', to:'post#delete'
      end
    end
  end
end
