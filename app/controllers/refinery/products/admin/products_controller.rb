module Refinery
  module Products
    module Admin
      class ProductsController < ::Refinery::AdminController

        crudify :'refinery/products/product',
                :title_attribute => 'name', :xhr_paging => true
          
        def create
            options = ::Refinery::Crud.default_options(Product)
            
            # if the position field exists, set this object as last object, given the conditions of this class.
            if Product.column_names.include?("position") && params[:product][:position].nil?
              params[:product].merge!({
                :position => ((Product.maximum(:position)||-1) + 1)
              })
            end
            @product = Product.new(params[:product])
            params[:photos].each do |photo|
              @product.photos.build photo.values_at(1)
            end
            if @product.valid? and @product.save
              flash.notice = t(
                'refinery.crudify.created',
                :what => "'#{@product.name}'"
              )

              unless from_dialog?
                unless params[:continue_editing] =~ /true|on|1/
                  redirect_back_or_default(options[:redirect_to_url])
                else
                  unless request.xhr?
                    redirect_to :back
                  else
                    render :partial => '/refinery/message'
                  end
                end
              else
                self.index
                @dialog_successful = true
                render :index
              end
            else
              unless request.xhr?
                render :action => 'new'
              else
                render :partial => '/refinery/admin/error_messages', :locals => {
                         :object => @product,
                         :include_object_name => true
                       }
              end
            end
          end

          def update
            options = ::Refinery::Crud.default_options(Product)
            @product.assign_attributes(params[:product])
            @product.update_photos params[:photos]
            if 
              flash.notice = t(
                'refinery.crudify.updated',
                :what => "'#{@product.name}'"
              )

              unless from_dialog?
                unless params[:continue_editing] =~ /true|on|1/
                  redirect_back_or_default(options[:redirect_to_url])
                else
                  unless request.xhr?
                    redirect_to :back
                  else
                    render :partial => '/refinery/message'
                  end
                end
              else
                self.index
                @dialog_successful = true
                render :index
              end
            else
              unless request.xhr?
                render :action => 'edit'
              else
                render :partial => '/refinery/admin/error_messages', :locals => {
                         :object => @product,
                         :include_object_name => true
                       }
              end
            end
          end
      end
    end
  end
end
