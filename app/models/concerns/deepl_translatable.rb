module DeeplTranslatable
  extend ActiveSupport::Concern

  included do
    before_save :translate_fields
  end

  class_methods do
    def translatable_fields(*fields)
      @translatable_fields = fields
    end

    def get_translatable_fields
      @translatable_fields
    end
  end

  private

  def translate_fields
    return unless self.class.get_translatable_fields

    self.class.get_translatable_fields.each do |field|
      es_field = field.to_s
      en_field = "en_#{field.to_s.sub('es_', '')}"

      if self[es_field].present? && self[en_field].blank?
        translated_text = DeepLService.translate(self[es_field], 'EN')
        self[en_field] = translated_text if translated_text
      elsif self[es_field].blank? && self[en_field].present?
        translated_text = DeepLService.translate(self[en_field], 'ES')
        self[es_field] = translated_text if translated_text
      end
    end
  end
end
