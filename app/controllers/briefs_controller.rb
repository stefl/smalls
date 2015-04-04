class BriefsController < ApplicationController

  def new
    @brief = Brief.new(:name => "An untitled brief")
  end

  def create
    @brief = Brief.new(brief_params)
    if @brief.save
      redirect_to brief_path(@brief)
    else
      flash[:errors] = "Sorry, your brief couldn't be saved"
      render :new
    end
  end

  def update
    @brief = Brief.friendly.find(params[:id])
    @brief.update_attributes(brief_params)
    redirect_to brief_path(@brief)
  end

  def show
    @brief = Brief.friendly.find(params[:id])
  end

  def edit
    @brief = Brief.friendly.find(params[:id])
    render :new
  end

  private
    def brief_params
      params.require(:brief).permit! #todo
    end
end
