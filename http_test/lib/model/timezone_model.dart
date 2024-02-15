class TimeZoneModel {
  final String? abbreviation;
  final String? clientIp;
  final String? datetime;
  final int? dayOfWeek;
  final int? dayOfYear;
  final bool? dst;
  final String? dstFrom;
  final int dstOffset;
  final String? dstUntil;
  final int? rawOffset;
  final String? timezone;
  final int? unixtime;
  final String? utcDatetime;
  final String? utcOffset;
  final int? weekNumber;

  TimeZoneModel({
    required this.abbreviation,
    required this.clientIp,
    required this.datetime,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.dst,
    required this.dstFrom,
    required this.dstOffset,
    required this.dstUntil,
    required this.rawOffset,
    required this.timezone,
    required this.unixtime,
    required this.utcDatetime,
    required this.utcOffset,
    required this.weekNumber,
  });

  DateTime? getDateTime() {
    return DateTime.parse(datetime ?? '').toLocal();
  }

  factory TimeZoneModel.fromJson(Map<String, dynamic> json) {
    return TimeZoneModel(
      abbreviation: json['abbreviation'],
      clientIp: json['client_ip'],
      datetime: json['datetime'],
      dayOfWeek: json['day_of_week'],
      dayOfYear: json['day_of_year'],
      dst: json['dst'],
      dstFrom: json['dst_from'],
      dstOffset: json['dst_offset'],
      dstUntil: json['dst_until'],
      rawOffset: json['raw_offset'],
      timezone: json['timezone'],
      unixtime: json['unixtime'],
      utcDatetime: json['utc_datetime'],
      utcOffset: json['utc_offset'],
      weekNumber: json['week_number'],
    );
  }
}
