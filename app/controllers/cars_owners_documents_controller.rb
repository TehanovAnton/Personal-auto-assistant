class CarsOwnersDocumentsController < ApplicationController
  before_action :set_cars_owners_document, only: %i[edit update]
  before_action :set_user, only: %i[new_document add_document update]

  def index
    @cars_owners_documents = CarsOwnersDocument.where(user_id: params[:user_id])
  end

  def new_document
    @cars_owners_documents = Document.select { |el| el unless @user.documents.include?(el) }
  end

  def add_document
    @user.documents << new_user_documents
    redirect_to cars_owners_documents_path(user_id: @user.id)
  end

  def edit; end

  def update
    if @cars_owners_document.update(cars_owners_document_params)
      binding.pry
      redirect_to cars_owners_documents_path(user_id: @user.id), notice: "Cars owners document was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_cars_owners_document
    @cars_owners_document = CarsOwnersDocument.find(params[:id])
  end

  def set_user
    @user = User.find_by(id: params[:cars_owners_document][:user_id])
  end

  def cars_owners_document_params
    params.require(:cars_owners_document).permit(:issue_date, :term_of_validity, :user_id )
  end

  def new_user_documents
    documents_params = params.require(:cars_owners_documents).permit(documents: [])
    documents_params = documents_params.to_h[:documents].map { |id| id.to_i if id.present? }.uniq
    Document.select { |p| p if documents_params.include?(p.id) }
  end
end
