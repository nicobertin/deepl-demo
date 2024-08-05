class Article < ApplicationRecord
    include DeeplTranslatable
    translatable_fields :es_title, :es_body
end
