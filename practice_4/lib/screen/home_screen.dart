import 'package:flutter/material.dart';
import 'package:practice_4/model/article_model.dart';
import 'package:practice_4/screen/detail_screen.dart';
import 'package:practice_4/screen/layout/default_layout.dart';
import 'package:practice_4/screen/widget/article_list_view_widget.dart';
import 'package:practice_4/screen/widget/custom_button_widget.dart';
import 'package:practice_4/screen/widget/custom_circular_progress_indicator.dart';
import 'package:practice_4/screen/widget/error_message_widget.dart';
import 'package:practice_4/screen/widget/image_widget.dart';
import 'package:practice_4/screen/widget/subject_title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<ArticleModel>> _getArticleList() async {
    await Future.delayed(const Duration(seconds: 1));
    return demoArticleModelList;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<ArticleModel>>(
              future: _getArticleList(),
              builder: (context, todayArticleSnapshot) {
                Widget child;
                if (todayArticleSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  child = const CustomCircularProgressIndicator();
                } else if (todayArticleSnapshot.hasError) {
                  child = const ErrorMessageWidget();
                } else {
                  final ArticleModel todayArticle = todayArticleSnapshot.data!
                      .where((element) => element.todayArticle)
                      .first;
                  child = Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildBackgroundImage(imagePath: todayArticle.imagePath),
                      _buildHomeLayout(
                        todayArticle: todayArticle,
                        articleList: todayArticleSnapshot.data!,
                        context: context,
                      ),
                    ],
                  );
                }
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeLayout({
    required ArticleModel todayArticle,
    required List<ArticleModel> articleList,
    required BuildContext context,
  }) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SubjectTitleWidget(title: 'TODAY ARTICLE'),
            const SizedBox(height: 16),
            _buildArticleButton(todayArticle: todayArticle, context: context),
            ArticleListViewWidget(articleList: articleList),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleButton(
      {required ArticleModel todayArticle, required BuildContext context}) {
    return Column(
      children: [
        Text(
          todayArticle.title,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        CustomButtonWidget(
          buttonText: 'READ NOW',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(article: todayArticle),
              ),
            );
          },
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildBackgroundImage({required String imagePath}) {
    return Column(
      children: [
        CustomImageWidget(
          imagePath: imagePath,
        ),
        CustomImageWidget(
          imagePath: imagePath,
          opacity: 0.3,
          isFliped: true,
        ),
      ],
    );
  }
}
