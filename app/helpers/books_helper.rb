module BooksHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_books_path
    elsif action_name == 'edit'
      book_path
    end
  end
  
  include ActsAsTaggableOn::TagsHelper
end
