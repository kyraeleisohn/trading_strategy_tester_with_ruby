
class StatisticGenerator
  def initialize(summary_converter)
    @summary_converter = summary_converter
  end

  def get(closed_trade_list)
    summary = ClosedTradeSummary.new
    closed_trade_list.each do |closed_trade|
      summary.add closed_trade
    end

    @summary_converter.get_as_statistic summary
  end
end