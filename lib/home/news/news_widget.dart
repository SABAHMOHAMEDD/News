import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/my_date_utils.dart';

import 'NewsResponse.dart';

class NewsWidget extends StatelessWidget {
  News news;

  NewsWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_rounded),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            news.author ?? "",
            style: const TextStyle(
                color: Color(
                  0xFF79828B,
                ),
                fontSize: 12),
          ),
          Text(
            news.title ?? "",
            style: const TextStyle(
                color: Color(0xFF42505C),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          Text(
            MyDateUtils.formatNewsDate(news.publishedAt ?? ""),
            style: const TextStyle(
                color: Color(0xFF79828B),
                fontSize: 12,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
