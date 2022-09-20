import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'home/NewsResponse.dart';

class NewsWidget extends StatelessWidget {
  News news;

  NewsWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: news.urlToImage ?? '',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error_rounded),
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
            news.publishedAt ?? '',
            style: const TextStyle(color: Color(0xFF79828B), fontSize: 12),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
