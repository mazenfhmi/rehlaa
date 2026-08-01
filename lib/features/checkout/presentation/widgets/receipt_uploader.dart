import 'package:flutter/material.dart';
import 'package:rehlaa/core/design_system/tokens/app_colors.dart';
import 'package:rehlaa/core/files/picked_file.dart';
import 'package:file_picker/file_picker.dart';

class ReceiptUploader extends StatelessWidget {
  const ReceiptUploader({
    required this.selectedFile,
    required this.onFilePicked,
    super.key,
  });

  final PickedFile? selectedFile;
  final ValueChanged<PickedFile> onFilePicked;

  Future<void> _pickFile() async {
    final result = await FilePicker.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      if (file.path != null) {
        onFilePicked(PickedFile(
          path: file.path!,
          name: file.name,
          sizeBytes: file.size,
          mimeType: file.extension != null ? 'image/${file.extension}' : 'image/jpeg',
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إيصال التحويل البنكي',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickFile,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.black5,
              border: Border.all(
                color: selectedFile != null ? AppColors.primary : AppColors.black20,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
              // Use dashed border conceptually, or just simple border
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  selectedFile != null ? Icons.check_circle : Icons.upload_file,
                  color: selectedFile != null ? AppColors.primary : AppColors.black60,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedFile != null ? 'تم إرفاق الإيصال بنجاح' : 'اضغط لإرفاق صورة الإيصال',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: selectedFile != null ? AppColors.primaryDark : AppColors.black80,
                            ),
                      ),
                      if (selectedFile != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          selectedFile!.name,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.black60,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                if (selectedFile != null)
                  const Icon(Icons.edit, size: 20, color: AppColors.primary),
              ],
            ),
          ),
        ),
      ],
    );
}
