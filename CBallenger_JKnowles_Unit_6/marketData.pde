JSONArray getStocks(String symbol, String startDate, String endDate){
  JSONObject response;
  JSONArray result;
  String url = new String("https://marketdata.websol.barchart.com/getHistory.json");
  String params =  "?apikey=" + apiKey + "&symbol=" + symbol + "&type=daily&startDate=" + startDate + "&endDate=" + endDate;
  
  response = loadJSONObject(url + params);
  result = response.getJSONArray("results");
  return result;
}
