require 'rails_helper'

# ------------------------------------------------------------------------------
# Tests Company Controller Index action
# ------------------------------------------------------------------------------
describe CompaniesController, '#index' do
    fixtures :users
    fixtures :companies

    it 'requires login' do
      get :index
      expect(response).to redirect_to login_path
    end

    it 'Responds okay' do
      #Setup
      session[:user_id] = 1 #simulate login since it is out of scope here
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'Renders index page' do
      #Setup
      session[:user_id] = 1
      get :index
      expect(response).to render_template(:index)
    end
end
# ------------------------------------------------------------------------------
# End section
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# Tests Company Controller Show action
# ------------------------------------------------------------------------------
describe CompaniesController, '#show' do
  fixtures :users
  fixtures :companies

  it 'requires login' do
    get :show, params: {id: 1}
    expect(response).to redirect_to login_path
  end

  it 'Responds okay' do
    #Setup
    session[:user_id] = 1 #simulate login since it is out of scope here
    get :show, params: {id: 1}
    expect(response).to have_http_status(:ok)
  end

  it 'Renders show page' do
    #Setup
    session[:user_id] = 1
    get :show, params: {id: 1}
    expect(response).to render_template(:show)
  end

end
# ------------------------------------------------------------------------------
# End section
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# Tests Company Controller New action
# ------------------------------------------------------------------------------
describe CompaniesController, '#new' do
  fixtures :users
  fixtures :companies

  it 'requires login' do
    get :new
    expect(response).to redirect_to login_path
  end

  it 'Responds okay' do
    #Setup
    session[:user_id] = 1 #simulate login since it is out of scope here
    get :new
    expect(response).to have_http_status(:ok)
  end

  it 'Renders new page' do
    #Setup
    session[:user_id] = 1
    get :new
    expect(response).to render_template(:new)
  end

end
# ------------------------------------------------------------------------------
# End section
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Tests Company Controller Create action
# ------------------------------------------------------------------------------
describe CompaniesController, '#create' do
  fixtures :users
  fixtures :companies

  it 'requires login' do
    post :create
    expect(response).to redirect_to login_path
  end

  it 'Creates new company' do
    session[:user_id] = 1 #simulate login since it is out of scope here
    expect {
      post :create, params: { 'company' => {
                                'name' => 'RobCo',
                                'website' => 'www.example.com',
                                'headquarters' => 'Local',
                                'size' => '1-50',
                                'founded' => '1997',
                                'industry' => 'Computers',
                                'revenue' => '100 mil',
                                'synopsis' => 'test'
                              }}
    }.to change(Company, :count).by(1)

  end

  it 'Redirects to the show page for that company' do
    session[:user_id] = 1
    post :create, params: { 'company' => {
                              'name' => 'RobCo',
                              'website' => 'www.example.com',
                              'headquarters' => 'Local',
                              'size' => '1-50',
                              'founded' => '1997',
                              'industry' => 'Computers',
                              'revenue' => '100 mil',
                              'synopsis' => 'test'
                            }}
    expect(response).to redirect_to company_path(Company.find(Company.last.id))
  end

end
# ------------------------------------------------------------------------------
# End section
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# Tests Company Controller New action
# ------------------------------------------------------------------------------
describe CompaniesController, '#destroy' do
  fixtures :users
  fixtures :companies

  it 'requires login' do
    delete :destroy, params: { id: 1 }
    expect(response).to redirect_to login_path
  end

  it 'Can delete a Company' do
    #Setup
    session[:user_id] = 1 #simulate login since it is out of scope here
    expect {
      delete :destroy, params: {id: 1}
    }.to change(Company, :count).by(-1)
  end

  it 'Renders new page' do
    #Setup
    session[:user_id] = 1
    delete :destroy, params: {id: 1}
    expect(response).to redirect_to companies_path
  end

end
# ------------------------------------------------------------------------------
# End section
# ------------------------------------------------------------------------------
