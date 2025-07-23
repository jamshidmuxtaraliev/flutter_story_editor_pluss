import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/style.dart';

// CaptionView is a StatelessWidget that provides UI for entering captions and initiating save operations.
class CaptionView extends StatelessWidget {
  final TextEditingController captionController; // Controller for text input.
  final VoidCallback onSaveClickListener; // Callback function when the save button is clicked.
  final FocusNode? focusNode; // Optional focus node to manage focus behavior.
  final bool isSaving; // Boolean indicating whether a save operation is in progress.

  // Constructor initializing all fields with required annotations for mandatory fields.
  const CaptionView(
      {super.key, required this.captionController, required this.onSaveClickListener, required this.isSaving, this.focusNode});

  @override
  Widget build(BuildContext context) {
    // Building the widget structure for the caption view.
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded corners for aesthetic appeal.
        color: darkGreenColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7), // engil qora soya
            spreadRadius: 4, // soyani kengaytirish
            blurRadius: 15, // soyani xiralashtirish
            offset: const Offset(0, 8), // soya yo‘nalishi (gorizontal, vertikal)
          ),
        ],
      ),
      // Background color set to dark green.
      child: TextFormField(
        focusNode: focusNode,
        // Assigning focus node if provided.
        controller: captionController,
        // Using the provided TextEditingController for text editing.
        style: const TextStyle(fontSize: 14, color: Colors.white),
        // Text style customization.
        minLines: 1,
        maxLines: 4,
        keyboardType: TextInputType.multiline,
        cursorColor: tealColor,
        // Cursor color set to teal for visual consistency.
        decoration: InputDecoration(
            border: InputBorder.none,
            // Icon for a visual hint at the start of the input field.
            suffixIcon: InkWell(
              onTap: onSaveClickListener, // Gesture detector to handle tap events on the save button.
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  backgroundColor: tealColor,
                  child: Center(
                    child: isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(color: Colors.white),
                          ) // Circular progress indicator when saving.
                        : const Icon(Icons.send_outlined, color: Colors.white), // Icon indicating send action.
                  ),
                ),
              ),
            ),
            hintText: "Add a caption...",
            // Placeholder text.
            contentPadding: const EdgeInsets.all(12),
            // Padding inside the input field.
            hintStyle: const TextStyle(color: Colors.white)), // Hint text style.
      ),
    );
  }
}
