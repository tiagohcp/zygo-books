require 'rails_helper'

describe Admin::BooksController, type: :controller do

  # this lets us inspect the rendered results
  render_views

  let(:page) { Capybara::Node::Simple.new(response.body) }
  let(:admin_user) { Fabricate :admin_user }
  before { sign_in admin_user } # if `sign_in` method not exists, please check this document https://github.com/heartcombo/devise#controller-tests.

  let!(:book) { Fabricate :book }

  let(:valid_attributes) do
    Fabricate.attributes_for :book
  end

  let(:invalid_attributes) do
    { title: '' }
  end

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the book' do
      get :index
      expect(assigns(:books)).to include(book)
    end
    it "should render the expected columns" do
      get :index
      expect(page).to have_content(book.title)
      expect(page).to have_content(book.description)
      expect(page).to have_content(book.author)
    end
    let(:filters_sidebar) { page.find('#filters_sidebar_section') }
    it "filter Name exists" do
      get :index
      expect(filters_sidebar).to have_css('label[for="q_title_or_description_cont"]', text: I18n.t('books.labels.title'))
      expect(filters_sidebar).to have_css('input[name="q[title_or_description_cont]"]')
    end
    it "filter Name works" do
      matching_book = Fabricate :book, title: 'ABCDEFG'
      non_matching_book = Fabricate :book, title: 'HIJKLMN'

      get :index, params: { q: { title_or_description_cont: 'BCDEF' } }

      expect(assigns(:books)).to include(matching_book)
      expect(assigns(:books)).not_to include(non_matching_book)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the book' do
      get :new
      expect(assigns(:book)).to be_a_new(Book)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field(I18n.t('books.labels.title'))
      expect(page).to have_field(I18n.t('books.labels.description'))
      expect(page).to have_field(I18n.t('books.labels.author'))
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Book" do
        expect {
          post :create, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it "assigns a newly created book as @book" do
        post :create, params: { book: valid_attributes }
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end

      it "redirects to the created book" do
        post :create, params: { book: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_book_path(Book.last))
      end

      it 'should create the book' do
        post :create, params: { book: valid_attributes }
        book = Book.last

        expect(book.title).to eq(valid_attributes[:title])
        expect(book.description).to  eq(valid_attributes[:description])
        expect(book.author).to      eq(valid_attributes[:author])
      end
    end

    context "with invalid params" do
      it 'invalid_attributes return http success' do
        post :create, params: { book: invalid_attributes }
        expect(response).to have_http_status(:success)
      end

      it "assigns a newly created but unsaved book as @book" do
        post :create, params: { book: invalid_attributes }
        expect(assigns(:book)).to be_a_new(Book)
      end

      it 'invalid_attributes do not create a Book' do
        expect do
          post :create, params: { book: invalid_attributes }
        end.not_to change(Book, :count)
      end
    end
  end

  describe "GET edit" do
    before do
      get :edit, params: { id: book.id }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'assigns the book' do
      expect(assigns(:book)).to eq(book)
    end
    it "should render the form elements" do
      expect(page).to have_field(I18n.t('books.labels.title'), with: book.title)
      expect(page).to have_field(I18n.t('books.labels.description'), with: book.description)
      expect(page).to have_field(I18n.t('books.labels.author'), with: book.author)
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      before do
        put :update, params: { id: book.id, book: valid_attributes }
      end
      it 'assigns the book' do
        expect(assigns(:book)).to eq(book)
      end
      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_book_path(book))
      end
      it "should update the book" do
        book.reload

        expect(book.description).to  eq(valid_attributes[:description])
        expect(book.title).to eq(valid_attributes[:title])
        expect(book.author).to      eq(valid_attributes[:author])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        put :update, params: { id: book.id, book: invalid_attributes }
        expect(response).to have_http_status(:success)
      end
      it 'does not change book' do
        expect do
          put :update, params: { id: book.id, book: invalid_attributes }
        end.not_to change { book.reload.title }
      end
    end
  end

  describe "GET show" do
    before do
      get :show, params: { id: book.id }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'assigns the book' do
      expect(assigns(:book)).to eq(book)
    end
    it "should render the form elements" do
      expect(page).to have_content(book.description)
      expect(page).to have_content(book.title)
      expect(page).to have_content(book.author)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      expect {
        delete :destroy, params: { id: book.id }
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the field" do
      delete :destroy, params: { id: book.id }
      expect(response).to redirect_to(admin_books_path)
    end
  end

end