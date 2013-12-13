class Flit < ActiveRecord::Base
  


  belongs_to :user
  has_many :comments,  :dependent => :destroy
  make_flaggable :like
  validates_presence_of :user_id, :message, :created_at, :on => :create, :message => "can't be blank"
  attr_accessible :created_at, :message, :user_id, :photo1, :audio, :video
    
  has_attached_file :photo1, :styles => { :small => "150x150>" },
                  :url  => "/assets/flits/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/flits/:id/:style/:basename.:extension"


  
  validates_attachment_size :photo1, :less_than => 5.megabytes
  validates_attachment_content_type :photo1, :content_type => ['image/jpeg', 'image/png'] 


  has_attached_file :audio  ,
           :url => "/assets/:class/:id/:attachment/:style.:extension",
           :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"

  validates_attachment_size :audio, :less_than => 50.megabytes
  validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']



   has_attached_file :video,
                  :url => "/assets/:class/:id/:attachment/:style.:extension",
           :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"

    validates_attachment_size :video, :less_than => 50.megabytes
    validates_attachment_content_type :video, :content_type => ['video/x-flv','video/mp4','video/x-flv','video/3gpp','video/JPEG','video/mp4','video/mpeg4']



end


