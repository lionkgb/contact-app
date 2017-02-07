class ContactsController < ApplicationController
  def index
    if params[:group]
      @contacts = Group.find_by(name: params[:group]).contacts
    else
      @contacts = Contact.all
    end 
  end
  def show 
    @contact = Contact.find_by(id: params[:id])
  end 
  def new
  end 
  def about_me
  end
  def create 
    first_name = params[:first_name],
    last_name = params[:last_name],
    email = params[:email],
    phone_number = params[:phone_number],
    contact = Contact.new({first_name: first_name , last_name: last_name , email: email , phone_number:number})
    contact.save
    flash[:success] = "Contact Created"
    redirect_to "/contacts/#{contact.id}" 
  end
  def edit 
    @contact = Contact.find_by(id: params[:id])
  end 
  def update 
    contact = Contact.find_by(id: params[:id])
    contact.assign_attributes({
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      phone_number: params[:phone_number], 
      })
    contact.save
    flash[:success] = "contact Updated"
    redirect_to "/contacts/#{contact.id}"
  end 
  def destroy 
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:danger] = "contact destroyed"
    redirect_to "/contacts" 
  end 
  def search 
    search_query = params[:search_input]
    @contacts = Contact.where("full_name LIKE ?""%#{search_query}%")
    if @contacts.empty?
      flash[:info] = "No contact found in search"
    end
    render :index
  end
end