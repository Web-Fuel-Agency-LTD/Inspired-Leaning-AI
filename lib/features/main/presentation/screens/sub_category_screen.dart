import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/core/utils/constants/image_strings.dart';
import 'package:inspired_learning_ai/features/main/domain/entities/sub_categories.dart';
import 'package:inspired_learning_ai/features/main/presentation/screens/home_page.dart';
import 'package:inspired_learning_ai/features/main/presentation/widgets/sub_category_item.dart';

class SubCategoryScreen extends StatelessWidget {
  final String categoryName;
  const SubCategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // TODO: connect to the backend
    // TODO: replace the sample data with the actual data from the backend
    final subcategories = [
      SubCategoryEntity(
        id: '',
        name: 'Mandatory',
        image: ILImages.subcat,
        categoryId: '',
      ),
      SubCategoryEntity(
        id: '',
        name: 'Modern Foreign Languages',
        image: ILImages.subcat1,
        categoryId: '',
      ),
      SubCategoryEntity(
        id: '',
        name: 'Humanity',
        image: ILImages.subcat2,
        categoryId: '',
      ),
      SubCategoryEntity(
        id: '',
        name: 'Technical',
        image: ILImages.subcat3,
        categoryId: '',
      ),
    ];

    return Scaffold(
      backgroundColor: ILColors.dark,
      appBar: AppBar(
        title: Text(
          categoryName,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: subcategories
              .map((subCategory) => SubCategoryItem(subCategory: subCategory))
              .toList(),
        ),
      ),
    );
  }
}
