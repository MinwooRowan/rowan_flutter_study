import 'package:flutter/material.dart';
import 'package:practice_4/model/article_model.dart';
import 'package:practice_4/screen/widget/image_widget.dart';
import 'package:practice_4/screen/widget/subject_title_widget.dart';

class ArticleListViewWidget extends StatelessWidget {
  final List<ArticleModel> articleList;
  const ArticleListViewWidget({super.key, required this.articleList});

  @override
  Widget build(BuildContext context) {
    final List<ArticleModel> exclusiveArticleList =
        articleList.where((article) => article.isExclusive).toList();

    return Column(
      children: [
        const SubjectTitleWidget(title: 'SUBSCRIBER EXCLUSIVE'),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: exclusiveArticleList.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CustomImageWidget(
                    imagePath: exclusiveArticleList[index].imagePath,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              }),
        ),
      ],
    );
  }
}
