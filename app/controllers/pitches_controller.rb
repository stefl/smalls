class PitchesController < ApplicationController

  def show
    @pitch = Pitch.find(params[:id])
  end

  def new
    @brief = Brief.friendly.find(params[:brief_id])
    @pitch = Pitch.new(brief_id: @brief.id)
  end

  def edit
    @brief = Brief.friendly.find(params[:brief_id])
    @pitch = Pitch.find(params[:id])
    render :new
  end

  def create
    @brief = Brief.friendly.find(params[:brief_id])
    @pitch = Pitch.new(pitch_params)
    logger.info pitch_params
    @pitch.brief_id = @brief.id
    logger.info @pitch.inspect
    logger.info @pitch.valid?
    if @pitch.save
      logger.info @pitch.id
      redirect_to brief_pitch_path(@brief, @pitch)
    else
      flash[:errors] = "Sorry, your pitch couldn't be saved"
      render :new
    end
  end

  def index
    @brief = Brief.friendly.find(params[:brief_id])

    redirect_to brief_path(@brief)
  end

  def update
    @pitch = Pitch.find(params[:id])
    @pitch.update_attributes(pitch_params)
    redirect_to brief_pitch_path(@pitch.brief, @pitch)
  end

  def fake
    @brief = Brief.friendly.find(params[:brief_id])
    @pitch = Pitch.new(brief_id: @brief.id)
    @pitch.fake!
    @pitch.save
    redirect_to edit_brief_pitch_path(@brief, @pitch)
  end

  private
    def pitch_params
      p = params.require(:pitch).permit! #todo
      if p[:links] 
        p[:links] = p[:links].split(",")
      end
      p
    end
end
