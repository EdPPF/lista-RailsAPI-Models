Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do # create, index, show, update e delete;
      scope 'post' do
        post 'create', to:'posts#create'
        get 'index', to:'posts#index'
        get 'show', to:'posts:show'
        patch 'update/:id', to:'posts#update'
        delete 'delete/:id', to:'posts#delete'
      end
    end
  end
end
