class CurrencyCable < BaseCable
  def index
    stream partial: "currency/index", locals: { feed: feed }
  end

  def show
    stream partial: "currency/show", locals: { feed: feed, date: date }
  end

  private

  def date
    @date ||= Date.parse(params[:date]) if params[:date]
  end

  def feed
    @feed ||= Fixer::Feed.new(feed_type)
  end

  def feed_type
    date.nil? ? :current : :historical
  end
end
