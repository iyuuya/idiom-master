class Admin::ThreePhrasesController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_three_phrase, only: [:edit, :update, :destroy]

  def index
    @three_phrases = ThreePhrase.page(params[:page])
    @count = @three_phrases.count
  end

  def edit
  end

  def update
    respond_to do |format|
      if @three_phrase.update(three_phrase_params)
        format.html { redirect_to admin_three_phrases_url, notice: 'Three phrase was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @three_phrase.destroy
    respond_to do |format|
      format.html { redirect_to admin_three_phrases_url, notice: 'Three phrase was successfully destroyed.' }
    end
  end

  private

  def set_three_phrase
    @three_phrase = ThreePhrase.find(params[:id])
  end

  def three_phrase_params
    params.require(:three_phrase).permit(:char1_id, :char2_id, :char3_id)
  end
end
