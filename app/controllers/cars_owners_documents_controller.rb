class CarsOwnersDocumentsController < ApplicationController
  before_action :set_cars_owners_document, only: %i[show edit update destroy]

  def index
    @cars_owners_documents = CarsOwnersDocument.where(user_id: params[:user_id])
  end

  def show; end

  def new
    @cars_owners_document = CarsOwnersDocument.new
  end

  def edit; end

  def create
    @cars_owners_document = CarsOwnersDocument.new(cars_owners_document_params)

    if @cars_owners_document.save
      redirect_to @cars_owners_document, notice: "Cars owners document was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cars_owners_document.update(cars_owners_document_params)
      redirect_to @cars_owners_document, notice: "Cars owners document was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cars_owners_document.destroy
    respond_to do |format|
      format.html { redirect_to cars_owners_documents_url, notice: 'Cars owners document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_cars_owners_document
    @cars_owners_document = CarsOwnersDocument.find(params[:id])
  end

  def cars_owners_document_params
    params.require(:cars_owners_document).permit(:issue_date, :term_of_validity)
  end
end
