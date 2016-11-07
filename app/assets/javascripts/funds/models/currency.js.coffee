class Currency extends CoinrootsModel.Model
  @configure 'Currency', 'key', 'code', 'coin', 'blockchain'

  @initData: (records) ->
    CoinrootsModel.Ajax.disable ->
      $.each records, (idx, record) ->
        currency = Currency.create(record.attributes)

window.Currency = Currency
