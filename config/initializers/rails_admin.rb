RailsAdmin.config do |config|

#This code is to edit/change the website name
  config.main_app_name = ["Management System", ""]

  config.navigation_static_links = {
  'Nissan' => ' https://www.nissan.ie/vehicles/new-vehicles/leaf.html'
}
config.navigation_static_label = "External Links"


  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)
   
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true


    config.model Sale do
      navigation_icon 'fa fa-money'
      create do
        field  :client
        field  :sale_date
        field  :discount
        field  :notes
        field  :product_quantities

        field :user_id, :hidden do
          default_value do
            bindings[:view]._current_user.id
          end
        end
      end

            edit do
        field  :client
        field  :sale_date
        field  :discount
        field  :notes
        field  :product_quantities

        field :user_id, :hidden do
          default_value do
            bindings[:view]._current_user.id
          end
        end
      end
    end

    config.model Client do
      create do
        field  :name
        field  :company_name
        field  :document
        field  :email
        field  :phone
        field  :notes
        field  :status
        field  :address

        field :user_id, :hidden do
          default_value do
            bindings[:view]._current_user.id
          end
        end
      end

      edit do
        field  :name
        field  :company_name
        field  :document
        field  :email
        field  :phone
        field  :notes
        field  :status
        field  :address


        field :user_id, :hidden do
          default_value do
            bindings[:view]._current_user.id
          end
        end
      end

      list do
        field  :name
        field  :company_name
        field  :document
        field  :email
        field  :phone
        field  :notes
        field  :status
        field  :address

      end
    end



    config.model Discount do
      navigation_icon 'fa fa-percent'
      parent Product
    end

    config.model Product do
      navigation_icon 'fa fa-product-hunt'
    end

    config.model User do
      navigation_icon 'fa fa-user'
    end

    config.model Sale do
      parent User
      weight -2
    end

    config.model Comission do
      navigation_icon 'fa fa-folder'
      parent User
      weight -1
    end

    config.model Client do
      navigation_icon 'fa fa-user-circle-o'
      parent User
    end

    config.model ProductQuantity do
      visible false
    end

    config.model Address do
      visible false
    end


    config.model ProductQuantity do
      edit do
        field :product
        field :quantity

        
        field :user_id, :hidden do
          default_value do
            bindings[:view]._current_user.id
          end
        end
      end
    end


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
