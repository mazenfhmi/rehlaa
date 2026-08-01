import 'package:freezed_annotation/freezed_annotation.dart';

part 'picked_file.freezed.dart';
part 'picked_file.g.dart';

@freezed
abstract class PickedFile with _$PickedFile {
  const factory PickedFile({
    required String path,
    required String name,
    required String mimeType,
    required int sizeBytes,
  }) = _PickedFile;

  factory PickedFile.fromJson(Map<String, dynamic> json) =>
      _$PickedFileFromJson(json);
}
