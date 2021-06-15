ActiveAdmin.register Book do

  permit_params :title,
                :description,
                :image,
                :author

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

  show do
    attributes_table do
      row :title
      row :description
      row :author
      row :image do |r|
        if r.image?
          image_tag url_for(r.image), :style => "width:100px;"
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :author
      f.input :image, as: :file
    end
    f.actions
  end
  
end
