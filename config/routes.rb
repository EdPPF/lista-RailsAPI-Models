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

      scope 'categories' do
        post 'create', to:'categories#create'
        get 'index', to:'categories#index'
        get 'show/:id', to:'categories#show'
        patch 'update/:id', to:'categories#update'
        delete 'delete/:id', to:'categories#delete'
      end

      scope 'feedbacks' do
        post 'create', to:'feedbacks#create'
        get 'index', to:'feedbacks#index'
        get 'show/:id', to:'feedbacks#show'
        patch 'update/:id', to:'feedbacks#update'
        delete 'delete/:id', to:'feedbacks#delete'
      end

      scope 'commentaries' do
        post 'create', to:'commentaries#create'
        get 'index', to:'commentaries#index'
        get 'show/:id', to:'commentaries#show'
        patch 'update/:id', to:'commentaries#update'
        delete 'delete/:id', to:'commentaries#delete'
      end
    end
  end
end
