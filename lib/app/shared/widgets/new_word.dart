import 'dart:io';

import 'package:dictionary_app/app/shared/logics/word_controller.dart';
import 'package:dictionary_app/app/shared/models/word.dart';
import 'package:dictionary_app/app/shared/widgets/buttons.dart';
import 'package:dictionary_app/app/ui/app_colors.dart';
import 'package:dictionary_app/app/ui/text_styles.dart';
import 'package:dictionary_app/app/utils/radius_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewWordDialog extends StatefulWidget {
  const NewWordDialog({super.key, required this.height});

  final double height;

  @override
  State<NewWordDialog> createState() => _NewWordDialogState();
}

class _NewWordDialogState extends State<NewWordDialog> {
  final WordController wordController = Get.find<WordController>();
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _translationController = TextEditingController();

  String? _selectedImageUrl;
  XFile? selectedImage;

  void _selectImage() async {
    // ✅ If you want to add Image Picker later:
    final ImagePicker _picker = ImagePicker();
    XFile? result = await _picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      setState(() {
        _selectedImageUrl = result.path;
        selectedImage = result;
      });
    }
  }

  // List of levels
  final List<String> _levels = ['Beginner', 'Intermediate', 'Advanced'];

  // Currently selected level
  String? _selectedLevel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add word",
                  style: QuickSandTextStyle.weightW600(
                    size: widget.height / 40,
                    color: AppColors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: widget.height / 120),
              child: Text(
                "Word",
                style: QuickSandTextStyle.weightW600(
                  size: widget.height / 46,
                  color: AppColors.grey,
                ),
              ),
            ),
            TextField(
              controller: _wordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.height / 25,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: widget.height / 120),
              child: Text(
                "Translation",
                style: QuickSandTextStyle.weightW600(
                    size: widget.height / 46, color: AppColors.grey),
              ),
            ),
            TextField(
              controller: _translationController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      widget.height / 25,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: widget.height / 120),
              child: Text(
                "Level",
                style: QuickSandTextStyle.weightW600(
                    size: widget.height / 46, color: AppColors.grey),
              ),
            ),
            DropdownButtonFormField<String>(
              dropdownColor: AppColors.white,
              borderRadius: BorderRadius.circular(
                widget.height / 25,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.height / 25,
                  ),
                ),
              ),
              value: _selectedLevel,
              items: _levels.map((String level) {
                return DropdownMenuItem<String>(
                  value: level,
                  child: Text(level),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLevel = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            _selectedImageUrl != null
                ? Container(
                    alignment: Alignment.center,
                    child: Image.file(
                      File(_selectedImageUrl!),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                : GestureDetector(
                    onTap: () => _selectImage(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: widget.height / 13,
                          width: widget.height / 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.borderColor,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.third,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Add photo",
                          style: QuickSandTextStyle.weightW600(
                            size: widget.height / 50,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 10),
            BasicButton(
              borderRadius: RadiusManager.circular(
                context: context,
                radius: 60,
              ),
              height: widget.height / 18,
              onTap: () {
                if (_translationController.text.isNotEmpty &&
                    _wordController.text.isNotEmpty &&
                    _selectedImageUrl != null) {
                  Word word = Word(
                    category: _selectedLevel!,
                    key: _wordController.text.trim(),
                    value: _translationController.text.trim(),
                    image: _selectedImageUrl!,
                  );
                  wordController.save(word);
                }
              },
              child: Text(
                "Save",
                style: QuickSandTextStyle.weightW600(
                  size: widget.height / 45,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
