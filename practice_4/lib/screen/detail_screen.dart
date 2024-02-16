import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_4/model/article_model.dart';
import 'package:practice_4/screen/layout/default_layout.dart';
import 'package:practice_4/screen/widget/image_widget.dart';
import 'package:practice_4/screen/widget/subject_title_widget.dart';

class DetailScreen extends StatelessWidget {
  final ArticleModel article;
  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(child: _buildContentWidget()),
          _buildControlWidget(context: context),
        ],
      ),
    );
  }

  Widget _buildContentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SubjectTitleWidget(title: article.title),
          ),
          const SizedBox(height: 12),
          CustomImageWidget(
            imagePath: article.imagePath,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  article.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlWidget({required BuildContext context}) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[700],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Text(
                  article.likeCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up_alt_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.thumb_down_alt_rounded,
                color: Colors.white,
              ),
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
