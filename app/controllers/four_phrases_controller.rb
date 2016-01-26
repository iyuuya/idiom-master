class FourPhrasesController < ApplicationController
  before_action :set_four_phrase, only: [:show, :edit, :update, :destroy]

  # GET /four_phrases
  # GET /four_phrases.json
  def index
    if params[:chars].present?
      @four_phrases = FourPhrase.from_string(params[:chars])
    else
      @four_phrases = FourPhrase.all
    end
    @four_phrases = @four_phrases.order(id: :desc).page(params[:page])
    @count = FourPhrase.count
  end

  # GET /four_phrases/1
  # GET /four_phrases/1.json
  def show
  end

  # GET /four_phrases/new
  def new
    @four_phrase = FourPhrase.new
  end

  # GET /four_phrases/1/edit
  def edit
  end

  # POST /four_phrases
  # POST /four_phrases.json
  def create
    @four_phrase = FourPhrase.create_from_string(four_phrase_params[:value])

    respond_to do |format|
      if @four_phrase.valid?
        format.html { redirect_to four_phrases_path }
      else
        format.html { render :new }
        format.json { render json: @four_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /four_phrases/1
  # PATCH/PUT /four_phrases/1.json
  def update
    respond_to do |format|
      if @four_phrase.update(four_phrase_params)
        format.html { redirect_to @four_phrase, notice: 'Four phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @four_phrase }
      else
        format.html { render :edit }
        format.json { render json: @four_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /four_phrases/1
  # DELETE /four_phrases/1.json
  def destroy
    @four_phrase.destroy
    respond_to do |format|
      format.html { redirect_to four_phrases_url, notice: 'Four phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_four_phrase
      @four_phrase = FourPhrase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def four_phrase_params
      params.require(:four_phrase).permit(:value)
    end
end
