class ArchivesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index, :datatables_index, :help_new_edit]
  before_action :set_archive, only: [:show, :edit, :update, :destroy]
  before_action :set_archive_by_uuid, only: [:show_uuid, :destroy_uuid, :send_link_archive_show_uuid_by_email]

  # GET /archives
  # GET /archives.json

  def datatables_index
    # always set user_filter if current_user not have role archive:index
    if policy(:archive).index_in_role? 
      user_filter = (params[:eager_filter_for_current_user].blank? || params[:eager_filter_for_current_user] == 'false' ) ? nil : current_user.id
    else
      user_filter = current_user.id
    end

    respond_to do |format|
      format.json { render json: ArchiveDatatable.new(params, view_context: view_context, eager_filter: user_filter ) }
    end
  end

  def index
    authorize :archive, :index?
    respond_to do |format|
      # disable button all/my if current_user not have role archive:index
      format.html { render :index, locals: {index_in_role: policy(:archive).index_in_role?} }
    end
  end

  # GET /archives/1
  # GET /archives/1.json
  def show
    authorize @archive, :show?
  end

  def show_uuid
    unless @archive.present?
      flash[:error] = t('errors.messages.not_found_resource')
      skip_authorization
      redirect_to root_path()
    else
      authorize @archive, :show?
      respond_to do |format|
        format.html { render :show }
      end
    end
  end

  # GET /archives/new
  def new
    @archive = Archive.new
    @archive.author = current_user
    @archive.expiry_on = Time.zone.today + Rails.application.secrets.archive_default_days_expiry_on_create.days
    authorize @archive, :new?
  end

  def help_new_edit
  end

  # GET /archives/1/edit
  def edit
    authorize @archive, :edit?
  end

  # POST /archives
  # POST /archives.json
  def create
    @archive = Archive.new(archive_params_create)
    @archive.author = current_user
    authorize @archive, :create?
    respond_to do |format|
      if @archive.save
        format.html { 
          flash[:success] = t('activerecord.successfull.messages.created', data: @archive.fullname)
          redirect_to show_uuid_archive_path(@archive.archive_uuid) 
        }
        format.json { render :show, status: :created, location: @archive }
      else
        format.html { render :new }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archives/1
  # PATCH/PUT /archives/1.json
  def update
    @archive.author = current_user
    authorize @archive, :update?
    respond_to do |format|
      if @archive.update(archive_params)
        format.html { 
          flash[:success] = t('activerecord.successfull.messages.updated', data: @archive.fullname)
          redirect_to show_uuid_archive_path(@archive.archive_uuid) 
        }
        format.json { render :show, status: :ok, location: @archive }
      else
        format.html { render :edit }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archives/1
  # DELETE /archives/1.json
  def destroy
    authorize @archive, :destroy?
    if @archive.destroy
      flash[:success] = t('activerecord.successfull.messages.destroyed', data: @archive.fullname)
      @archive.log_work('destroy', current_user.id)
      redirect_to archives_url
    else 
      flash.now[:error] = t('activerecord.errors.messages.destroyed', data: @archive.fullname)
      render :show
    end      
  end

  # DELETE /archives/1
  # DELETE /archives/1.json
  def destroy_uuid
    authorize @archive, :destroy?
    if @archive.destroy
      flash[:success] = t('activerecord.successfull.messages.destroyed', data: @archive.fullname)
      @archive.log_work('destroy', current_user.id)
      redirect_to archives_url
    else 
      flash.now[:error] = t('activerecord.errors.messages.destroyed', data: @archive.fullname)
      render :show
    end      
  end

  def send_link_archive_show_uuid_by_email
    authorize @archive, :send_link_archive_show_uuid_by_email?

    if params[:users_ids].blank?
      respond_to do |format|
        format.js { render :blank_users_ids }
      end
    else
      params[:users_ids].each do |i|
        user = User.find(i)
        ArchiveMailer.link_archive_show_uuid(@archive, user).deliver_later
      end
      # #flash[:success] = t('activerecord.successfull.messages.created', data: @event.fullname)
      # redirect_to @archive, notice: "Email status about \"#{@archive.fullname}\" was successfully sent."

      respond_to do |format|
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    def set_archive_by_uuid
      @archive = Archive.find_by(archive_uuid: params[:uuid])
    end

    # Only allow a list of trusted parameters through.
    def archive_params
      # params.require(:archive).permit(:name, :note)
      params.require(:archive).permit(policy(@archive).permitted_attributes)      
      # params.require(:archive).permit(:name, :note, archivizations_attributes: [:id, :archives_id, :group_id, :archivization_type_id, :_destroy])
    end

    def archive_params_create
      # params.require(:archive).permit(:name, :note)
      params.require(:archive).permit(policy(:archive).permitted_attributes)      
      # params.require(:archive).permit(:name, :note, archivizations_attributes: [:id, :archives_id, :group_id, :archivization_type_id, :_destroy])
    end

end
