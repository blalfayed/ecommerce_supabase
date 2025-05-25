import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_elevated_btn.dart';
import 'package:ecommerce_supabase/views/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/functions/build_appbar.dart';

class EditNameView extends StatelessWidget {
  const EditNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Edit Name'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomTextFormField(
                labeltext: 'Enter Name', keyBoardType: TextInputType.text),
            const SizedBox(
              height: 20,
            ),
            CustomEBtn(
              text: 'Update',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
