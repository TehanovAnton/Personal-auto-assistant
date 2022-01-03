class UserService
  def create_documents(documents:, user_id:)
    documents.each do |document|
      binding.pry
      args = document.last.to_h
      args[:user_id] = user_id
      args[:document_id] = Document.find_by(name: document.first).id
      CarOwnerDocument.create(args)
    end
  end
end
