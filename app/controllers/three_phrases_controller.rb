class ThreePhrasesController < ApplicationController
  before_action :set_three_phrase, only: [:show, :edit, :update, :destroy]

  # GET /three_phrases
  # GET /three_phrases.json
  def index
    if params[:chars].present?
      @three_phrases = ThreePhrase.from_string(params[:chars])
    else
      @three_phrases = ThreePhrase.all
    end
    @three_phrases = @three_phrases.order(id: :desc).page(params[:page])
    @three_phrase_count = ThreePhrase.count
  end

  # GET /three_phrases/1
  # GET /three_phrases/1.json
  def show
  end

  # GET /three_phrases/new
  def new
    @three_phrase = ThreePhrase.new
  end

  # GET /three_phrases/1/edit
  def edit
  end

  # POST /three_phrases
  # POST /three_phrases.json
  def create
    @three_phrase = ThreePhrase.create_from_string(three_phrase_params[:value])

    respond_to do |format|
      if @three_phrase.valid?
        format.html { redirect_to three_phrases_path }
      else
        format.html { render :new }
        format.json { render json: @three_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /three_phrases/1
  # PATCH/PUT /three_phrases/1.json
  def update
    respond_to do |format|
      if @three_phrase.update(three_phrase_params)
        format.html { redirect_to @three_phrase, notice: 'Three phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @three_phrase }
      else
        format.html { render :edit }
        format.json { render json: @three_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /three_phrases/1
  # DELETE /three_phrases/1.json
  def destroy
    @three_phrase.destroy
    respond_to do |format|
      format.html { redirect_to three_phrases_url, notice: 'Three phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_three_phrase
      @three_phrase = ThreePhrase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def three_phrase_params
      params.require(:three_phrase).permit(:value)
    end
end
