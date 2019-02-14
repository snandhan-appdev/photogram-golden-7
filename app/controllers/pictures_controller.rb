class PicturesController < ApplicationController
    def index
        @photo_list = Photo.all.order({:created_at => :desc})
        render("pic_templates/all_photos.html.erb")
    end
    
    def new_form
        render("pic_templates/blank_form.html.erb")
    end
    
    def create_row
        p = Photo.new
        p.source = params.fetch(:the_source) 
        p.caption = params.fetch(:the_caption)
        p.save
        
        redirect_to("https://photogram-week5-snandhan.c9users.io/photos")
        #render("pic_templates/create.html.erb")
    end
    
    def show_details
        @active_photo_id = params.fetch(:an_id_number)
        @active_photo = Photo.find(@active_photo_id)

        render("pic_templates/details.html.erb")
    end
    
    def edit_form
        the_id = params.fetch(:some_id_number)
        @photo_to_edit = Photo.find(the_id)
        
        render("pic_templates/edit.html.erb")
    end
    
    def update_row
        
        @the_id = params.fetch(:the_id_number)
        p = Photo.find(@the_id)
        p.source = params.fetch(:the_url)
        p.caption = params.fetch(:the_caption)
        p.save
        
        redirect_to("https://photogram-week5-snandhan.c9users.io/photos/" + @the_id)
        #render("pic_templates/update.html.erb")
    end
    
    def destroy_row
        @id = params.fetch(:bye_id_number)
        @active_photo = Photo.find(@id)
        @active_photo.destroy
        
        redirect_to("https://photogram-week5-snandhan.c9users.io/photos")
        #render("pic_templates/destroy.html.erb")
    end
    
end