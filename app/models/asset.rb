class Asset < ActiveRecord::Base
  
  belongs_to :attachable, :polymorphic => true
  belongs_to :creator, :class_name => 'User', :foreign_key => "created_by"
  belongs_to :updator, :class_name => 'User', :foreign_key => "updated_by"
  
  has_attached_file :data,
      :path => ':rails_root/private/files/:id/:style/:basename.:extension',
      :url => lambda {|asset|
        path = "/:class/:id/:style"
        if attachable = asset.instance.attachable
          user = attachable.is_a?(User) ? attachable : attachable.user
          path = "/users/#{user.to_param}" + path
        end
        path
      },
      :styles => { :small => "150x150>" }
      
  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 10.megabytes
  
  attr_protected :data_file_name, :data_content_type, :data_file_size, :orig_name
  before_post_process :image?

  def before_create
    self.created_by = User.curr_user.id
    self.updated_by = User.curr_user.id
  end

  def before_update
    self.updated_by = User.curr_user.id
  end
  
  def file_icon
    icon_path = "file_icons/48px/#{File.extname(data_file_name).sub('.','')}.png"
    if File.exists? "#{RAILS_ROOT}/public/images/#{icon_path}"
      icon_path
    else
      "file_icons/48px/_blank.png"
    end
  end
  
  def image?
    !(data_content_type =~ /^image.*/).nil?
  end
  
  def url(*args)
    data.url(*args)
  end
  
  def to_s
    data_file_name
  end
  
end