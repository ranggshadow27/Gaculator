class Genshin {
  int? totalDay;
  int? totalPrimogem;
  int? currentPrimogem;
  int? currentFate;
  int? currentPity;
  int? spiralAbbyssIncome;
  int? paimonShopIncome;
  int? mainEventIncome;
  int? firstEventIncome;
  int? secondEventIncome;
  int? thirdEventIncome;
  int? liveStreamIncome;
  int? maintenanceIncome;
  int? otherIncome;
  int? battlePassIncome;

  Genshin({
    this.totalDay,
    this.totalPrimogem,
    this.currentFate,
    this.currentPity,
    this.currentPrimogem,
    this.spiralAbbyssIncome,
    this.paimonShopIncome,
    this.mainEventIncome,
    this.firstEventIncome,
    this.secondEventIncome,
    this.thirdEventIncome,
    this.liveStreamIncome,
    this.maintenanceIncome,
    this.battlePassIncome,
    this.otherIncome,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalDay': totalDay,
      'totalPrimogem': totalPrimogem,
      'currentPity': currentPity,
      'currentFate': currentFate,
      'currentPrimogem': currentPrimogem,
      'spiralAbbyssIncome': spiralAbbyssIncome,
      'paimonShopIncome': paimonShopIncome,
      'mainEventIncome': mainEventIncome,
      'firstEventIncome': firstEventIncome,
      'secondEventIncome': secondEventIncome,
      'thirdEventIncome': thirdEventIncome,
      'liveStreamIncome': liveStreamIncome,
      'maintenanceIncome': maintenanceIncome,
      'battlePassIncome': battlePassIncome,
      'otherIncome': otherIncome,
    };
  }
}
