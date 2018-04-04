class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.tag_enum_name(enum_value)
    I18n.t("activerecord.attributes.book.tag_lists.#{enum_value}")
  end
end
