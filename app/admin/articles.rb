ActiveAdmin.register Article do
  index do
    selectable_column
    column :id
    column "Title" do |article|
      link_to article.title, admin_article_path(article)
    end
    column :body
    column :created_at
    actions dropdown: true do |action|
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :status, :cover_image
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :status, :cover_image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
