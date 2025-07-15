import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String code;
  final String name;
  final String flag;
  final String countryCode;

  const Language({
    required this.code,
    required this.name,
    required this.flag,
    required this.countryCode,
  });

  @override
  List<Object> get props => [code, name, flag, countryCode];

  @override
  bool get stringify => true;
}