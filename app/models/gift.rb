class Gift < ActiveRecord::Base
  has_attached_file :image, :styles => { :small => "150x150>", :thumb => "75x75>"},
                    #:url => "/app/assets/images/:id/:style/:basename.:extension",
                    #:path =>":rails_root/app/assets/images/:id/:style/:basename.:extension",
                    use_timestamp: false
                    #:attachment=gifts, :style = {original, medium}
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
