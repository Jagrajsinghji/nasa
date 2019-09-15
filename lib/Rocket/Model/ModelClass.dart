
class Launch{

  int _id;
  String _name;
  Map _rocket;
  int _status;
  String _windowStart;
  String _windowEnd;
  List _infoURLs;
  List _vidURLs;
  String _holdReason;//only if status is red i.e 2
  String _failReason;//only if status is failed i.e 4


/// lauch id
  int get id              => _id;
  /// launch name
  String get name         => _name;
  /// rocket data
  Map get rocket          => _rocket;
  /// status of launch ,1 Green, 2 Red, 3 Success, 4 Failed
  int get status          => _status;
  /// String (formatted as Month, dd, yyyy hh24:mi:ss UTC)
  String get windowStart  => _windowStart;
  /// String (formatted as Month, dd, yyyy hh24:mi:ss UTC)
  String get windowEnd    => _windowEnd;
  /// Array of strings including information links
  List get infoURLs       => _infoURLs;
  /// Array of strings including video links
  List get vidURLs        => _vidURLs;
  /// Launch hold reason
  String get holdReason   => _holdReason;
  /// Launch fail reason
  String get failReason   => _failReason;



/// to set data in the instance
  void setLaunch(Map launchInfo){
     _id=launchInfo['id']??0;
     _name=launchInfo['name']??" ";
     _rocket=launchInfo['rocket']??{};
     _status=launchInfo['status']??0;
     _windowStart=launchInfo['windowstart']??" ";
     _windowEnd=launchInfo['windowend']??" ";
     _infoURLs=launchInfo['infoURL']??[];
     _vidURLs=launchInfo['vidURLs']??[];
     _holdReason=launchInfo['holdreason']??" ";
     _failReason=launchInfo['failreason']??" ";
  }


}
