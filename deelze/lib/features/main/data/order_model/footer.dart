import 'package:freezed_annotation/freezed_annotation.dart';

part 'footer.freezed.dart';
part 'footer.g.dart';

@freezed
class Footer with _$Footer {
  factory Footer({
    double? subTotal,
    double? discount,
    double? serviceCharge,
    double? vat,
    double? grandTotal,
  }) = _Footer;

  factory Footer.fromJson(Map<String, dynamic> json) => _$FooterFromJson(json);
}
