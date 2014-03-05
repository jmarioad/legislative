require 'json'
require 'rest_client'

class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  
  # GET /tables
  def index
    @agendas = get_all_the_agendas
    # @tables = TableCollection.new
    # @tables.get(ENV['tables_url'],'application/json')
  end

  # GET /tables/1
  def show
  end

  # GET /tables/new
  def new
    # @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  def create
    # @table = Table.new(table_params)

    # if @table.save
    #   redirect_to @table, notice: 'Table was successfully created.'
    # else
    #   render action: 'new'
    # end
  end

  # PATCH/PUT /tables/1
  def update
    # if @table.update(table_params)
    #   redirect_to @table, notice: 'Table was successfully updated.'
    # else
    #   render action: 'edit'
    # end
  end

  # DELETE /tables/1
  def destroy
    # @table.destroy
    redirect_to tables_url, notice: 'Table was successfully destroyed.'
  end

  # GET all the agendas
  def get_all_the_agendas
    response = RestClient.get(ENV['agendas_url'] + "select%20*%20from%20data%20limit%2020", :content_type => :json, :accept => :json, :"x-api-key" => ENV['agendas_api_key'])
    response = JSON.parse(response)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def table_params
      params[:table]
    end
end
