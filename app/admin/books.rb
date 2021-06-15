ActiveAdmin.register Book do

  index do
    selectable_column
    column :title
    column :description
    column :author
    column :image do |r|
      if r.image?
        image_tag url_for(r.image), :style => "width:100px;"
      end
    end
    actions
  end
  
end
