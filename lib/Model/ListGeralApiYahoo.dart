class ListGeralApiYahoo{

   dynamic  currency;
   dynamic  symbol;
   dynamic  exchangeName;
   dynamic  instrumentType;
   dynamic  firstTradeDate;
   late int  regularMarketTime;
   late int  gmtoffset;
   dynamic  timezone;
   dynamic  exchangeTimezoneName;
   late double   regularMarketPrice;
   late double  chartPreviousClose;
   late double  previousClose;
   late int scale;
   late int  priceHint;

   ListGeralApiYahoo(
      this.currency,
      this.symbol,
      this.exchangeName,
      this.instrumentType,
      this.firstTradeDate,
      this.regularMarketTime,
      this.gmtoffset,
      this.timezone,
      this.exchangeTimezoneName,
      this.regularMarketPrice,
      this.chartPreviousClose,
      this.previousClose,
      this.scale,
      this.priceHint);

   dynamic get Currency => currency;
   set Currency(dynamic value) {
     currency = value;
   }
   dynamic get ExchangeName => exchangeName;
   set ExchangeName(dynamic value) {
     exchangeName = value;
   }
   dynamic get RegularMarketTime => regularMarketTime;
   set RegularMarketTime(dynamic value) {
     priceHint = value;
   }
   dynamic get FirstTradeDate => firstTradeDate;
   set FirstTradeDate(dynamic value) {
     scale = value;
   }
   dynamic get InstrumentType => instrumentType;
   set InstrumentType(dynamic value) {
     previousClose = value;
   }
   dynamic get PriceHint => priceHint;
   set PriceHint(dynamic value) {
     priceHint = value;
   }
   dynamic get Scale => scale;
   set Scale(dynamic value) {
     scale = value;
   }
   dynamic get PreviousClose => previousClose;
   set PreviousClose(dynamic value) {
     previousClose = value;
   }
   dynamic get ChartPreviousClose => chartPreviousClose;
   set ChartPreviousClose(dynamic value) {
     chartPreviousClose = value;
   }
   dynamic get RegularMarketPrice => regularMarketPrice;
   set RegularMarketPrice(dynamic value) {
     regularMarketPrice = value;
   }
   dynamic get ExchangeTimezoneName => exchangeTimezoneName;
   set ExchangeTimezoneName(dynamic value) {
     exchangeTimezoneName = value;
   }
   dynamic get Timezone => timezone;
   set Timezone(dynamic value) {
     timezone = value;
   }
   dynamic get Gmtoffset => gmtoffset;
   set Gmtoffset(dynamic value) {
     gmtoffset = value;
   }
}

